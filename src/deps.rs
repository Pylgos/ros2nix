use anyhow::Result;
use serde::Serialize;
use std::collections::{BTreeMap, BTreeSet};
use tracing::warn;

use crate::{
    config::ConfigRef,
    rosindex::{PackageManifest, RosDependencyKind},
};

#[derive(Debug, Clone, Copy, Eq, PartialEq, PartialOrd, Ord, Serialize)]
pub enum NixDependencyKind {
    HostTarget,
    BuildHost,
    TargetTarget,
    Check,
}

#[derive(Debug, Clone, Eq, PartialEq, PartialOrd, Ord)]
pub struct NixDependency {
    pub name: String,
    pub kind: NixDependencyKind,
    pub propagated: bool,
}

pub type NixDependencies = BTreeSet<NixDependency>;

#[derive(Debug, Clone, Eq, PartialEq, PartialOrd, Ord, Serialize)]
struct ClassifiedRosDependency {
    name: String,
    kind: NixDependencyKind,
    propagated: bool,
}

pub fn resolve_dependencies(
    cfg: &ConfigRef,
    manifests: &BTreeMap<String, PackageManifest>,
) -> Result<BTreeMap<String, NixDependencies>> {
    let package_deps = classify_dependencies(cfg, manifests)?;

    let mut all_unbuildable = BTreeSet::new();
    let mut unbuildable_by = BTreeMap::new();
    for (name, deps) in package_deps.iter() {
        for dep in deps.iter() {
            if !package_deps.contains_key(dep.name.as_str())
                && !cfg.system_packages().contains_key(dep.name.as_str())
            {
                all_unbuildable.insert(name.as_str());
                unbuildable_by
                    .entry(dep.name.as_str())
                    .or_insert_with(BTreeSet::new)
                    .insert(name.as_str());
            }
        }
    }

    let mut prev_all_unbuildable_len = all_unbuildable.len();
    loop {
        for (name, deps) in package_deps.iter() {
            if all_unbuildable.contains(name.as_str()) {
                continue;
            }

            for dep in deps.iter() {
                for (_missing, unbuildable) in unbuildable_by.iter_mut() {
                    if unbuildable.contains(dep.name.as_str()) {
                        unbuildable.insert(name.as_str());
                        all_unbuildable.insert(name.as_str());
                    }
                }
            }
        }

        if all_unbuildable.len() == prev_all_unbuildable_len {
            break;
        }
        prev_all_unbuildable_len = all_unbuildable.len();
    }

    for (missing, unbuildable) in unbuildable_by.iter() {
        warn!("due to missing dependency {missing:?}, following packages may be unbuildable: {unbuildable:?}");
    }

    let resolve = |deps: &BTreeSet<ClassifiedRosDependency>| -> BTreeSet<NixDependency> {
        let mut res = BTreeSet::new();
        for dep in deps {
            if let Some(pkgs) = cfg.system_packages().get(dep.name.as_str()) {
                res.extend(pkgs.iter().map(|d| NixDependency {
                    name: d.clone(),
                    kind: dep.kind,
                    propagated: dep.propagated,
                }));
            } else if manifests.contains_key(dep.name.as_str()) {
                res.insert(NixDependency {
                    name: dep.name.clone(),
                    kind: dep.kind,
                    propagated: dep.propagated,
                });
            }
        }
        res
    };

    Ok(package_deps
        .into_iter()
        .map(|(name, deps)| (name, resolve(&deps)))
        .collect())
}

fn map_dependency_kind(
    dependency_kind: RosDependencyKind,
    dependant_is_buildtool: bool,
    dependency_is_buildtool: bool,
    dependency_is_both_buildtool_and_runtime: bool,
) -> BTreeSet<NixDependencyKind> {
    use NixDependencyKind::*;
    use RosDependencyKind::*;
    if dependency_kind == Test {
        [Check].into_iter().collect()
    } else if dependency_is_both_buildtool_and_runtime {
        match dependency_kind {
            Build | BuildExport | Exec => [HostTarget].into_iter().collect(),
            Buildtool | BuildtoolExport => [BuildHost].into_iter().collect(),
            Test => unreachable!(),
        }
    } else if dependant_is_buildtool {
        if dependency_is_buildtool {
            [BuildHost, HostTarget].into_iter().collect()
        } else {
            [TargetTarget].into_iter().collect()
        }
    } else if dependency_is_buildtool {
        [BuildHost].into_iter().collect()
    } else {
        [HostTarget].into_iter().collect()
    }
}

fn is_propagation_required(dependency_kind: RosDependencyKind) -> bool {
    use RosDependencyKind::*;
    matches!(dependency_kind, BuildExport | BuildtoolExport | Exec)
}

fn classify_dependencies(
    _cfg: &ConfigRef,
    manifests: &BTreeMap<String, PackageManifest>,
) -> Result<BTreeMap<String, BTreeSet<ClassifiedRosDependency>>> {
    let mut buildtools = BTreeSet::new();

    let mut definetly_not_buildtools = BTreeSet::new();
    definetly_not_buildtools.extend(
        manifests
            .values()
            .filter(|m| {
                m.member_of_group.contains("rosidl_interface_packages")
                    || m.member_of_group
                        .contains("rosidl_typesupport_cpp_packages")
                    || m.member_of_group.contains("rosidl_typesupport_c_packages")
                    || m.member_of_group.contains("rosidl_runtime_packages")
                    || m.member_of_group.contains("rmw_implementation_packages")
            })
            .map(|m| m.name.as_str()),
    );
    definetly_not_buildtools.extend([
        "ros2test", "ros2run", "rmf_building_map_tools", "rosidl_typesupport_interface", "qt5-qmake", 
    ].iter());

    let mut both_buildtools_and_runtime = BTreeSet::new();
    both_buildtools_and_runtime.insert("python3");

    let mut prev_buildtools_len = 0;
    loop {
        for manifest in manifests.values() {
            let deps = &manifest.dependencies.deps;
            for dep in deps.iter().filter(|d| d.kind.is_buildtool()) {
                if !definetly_not_buildtools.contains(dep.name.as_str()) {
                    buildtools.insert(dep.name.as_str());
                }
            }

            if buildtools.contains(manifest.name.as_str()) {
                for dep in deps.iter().filter(|d| d.kind.is_runtime()) {
                    if !definetly_not_buildtools.contains(dep.name.as_str()) {
                        buildtools.insert(dep.name.as_str());
                    }
                }
            }
        }

        if buildtools.len() == prev_buildtools_len {
            break;
        }
        prev_buildtools_len = buildtools.len();
    }

    let mut groups = BTreeMap::new();
    for manifest in manifests.values() {
        for group in manifest.member_of_group.iter() {
            groups
                .entry(group.clone())
                .or_insert_with(BTreeSet::new)
                .insert(manifest.name.clone());
        }
    }

    Ok(manifests
        .values()
        .map(|m| {
            let deps = &m.dependencies.deps;
            let res: BTreeSet<ClassifiedRosDependency> = deps
                .iter()
                .flat_map(|d| {
                    map_dependency_kind(
                        d.kind,
                        buildtools.contains(m.name.as_str()),
                        buildtools.contains(d.name.as_str()),
                        both_buildtools_and_runtime.contains(d.name.as_str()),
                    )
                    .into_iter()
                    .map(|kind| ClassifiedRosDependency {
                        name: d.name.clone(),
                        kind,
                        propagated: is_propagation_required(d.kind),
                    })
                })
                .chain(m.dependencies.group_deps.iter().flat_map(|group| {
                    groups.get(group).into_iter().flat_map(|members| {
                        members.iter().map(|d| ClassifiedRosDependency {
                            name: d.clone(),
                            kind: NixDependencyKind::HostTarget,
                            propagated: false,
                        })
                    })
                }))
                .collect();

            let res = res
                .iter()
                .filter(|d| {
                    d.propagated
                        || !res.contains(&ClassifiedRosDependency {
                            name: d.name.clone(),
                            kind: d.kind,
                            propagated: true,
                        })
                })
                .cloned()
                .collect();

            (m.name.clone(), res)
        })
        .collect())
}
