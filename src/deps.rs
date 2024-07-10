use anyhow::Result;
use std::collections::{BTreeMap, BTreeSet};
use tracing::warn;

use crate::{config::ConfigRef, rosindex::PackageManifest};

#[derive(Debug, Clone, Default)]
pub struct Dependencies {
    pub host_target: BTreeSet<String>,
    pub host_target_propagated: BTreeSet<String>,
    pub build_host: BTreeSet<String>,
    pub build_host_propagated: BTreeSet<String>,
    pub target_target: BTreeSet<String>,
    pub target_target_propagated: BTreeSet<String>,
}

#[derive(Debug, Clone, Default)]
struct ClassifiedDependencies {
    host_target: BTreeSet<String>,
    host_target_propagated: BTreeSet<String>,
    build_host: BTreeSet<String>,
    build_host_propagated: BTreeSet<String>,
    target_target: BTreeSet<String>,
    target_target_propagated: BTreeSet<String>,
}

impl ClassifiedDependencies {
    fn all(&self) -> impl Iterator<Item = &str> {
        self.host_target
            .iter()
            .chain(&self.host_target_propagated)
            .chain(&self.build_host)
            .chain(&self.build_host_propagated)
            .chain(&self.target_target)
            .chain(&self.target_target_propagated)
            .map(|s| s.as_str())
    }
}

pub fn resolve_dependencies(
    cfg: &ConfigRef,
    manifests: &BTreeMap<String, PackageManifest>,
) -> Result<BTreeMap<String, Dependencies>> {
    let package_deps = classify_dependencies(cfg, manifests)?;

    let mut all_unbuildable = BTreeSet::new();
    let mut unbuildable_by = BTreeMap::new();
    for (name, deps) in package_deps.iter() {
        for dep in deps.all() {
            if !package_deps.contains_key(dep) && !cfg.system_packages().contains_key(dep) {
                all_unbuildable.insert(name.as_str());
                unbuildable_by
                    .entry(dep)
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

            for dep in deps.all() {
                for (_missing, unbuildable) in unbuildable_by.iter_mut() {
                    if unbuildable.contains(dep) {
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
        warn!("due to missing dependency {missing:?}, following packages is unbuildable: {unbuildable:?}");
    }

    let resolve = |deps: &BTreeSet<String>| -> BTreeSet<String> {
        let mut res = BTreeSet::new();
        for dep in deps {
            if let Some(pkgs) = cfg.system_packages().get(dep.as_str()) {
                res.extend(pkgs.iter().cloned());
            } else {
                res.insert(dep.clone());
            }
        }
        res
    };

    Ok(package_deps
        .iter()
        .filter(|(name, _deps)| !all_unbuildable.contains(name.as_str()))
        .map(|(name, deps)| {
            (
                name.clone(),
                Dependencies {
                    host_target: resolve(&deps.host_target),
                    host_target_propagated: resolve(&deps.host_target_propagated),
                    build_host: resolve(&deps.build_host),
                    build_host_propagated: resolve(&deps.build_host_propagated),
                    target_target: resolve(&deps.target_target),
                    target_target_propagated: resolve(&deps.target_target_propagated),
                },
            )
        })
        .collect())
}

fn classify_dependencies(
    _cfg: &ConfigRef,
    manifests: &BTreeMap<String, PackageManifest>,
) -> Result<BTreeMap<String, ClassifiedDependencies>> {
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
    definetly_not_buildtools.insert("rosidl_typesupport_interface");
    definetly_not_buildtools.insert("rmf_building_map_tools");
    definetly_not_buildtools.insert("ros2run");
    definetly_not_buildtools.insert("ros2test");

    let mut both_buildtools_and_runtime = BTreeSet::new();
    both_buildtools_and_runtime.insert("python3");

    let mut prev_buildtools_len = 0;
    loop {
        for manifest in manifests.values() {
            let deps = &manifest.dependencies;
            for dep in deps.buildtool.iter().chain(deps.buildtool_export.iter()) {
                if !definetly_not_buildtools.contains(dep.as_str()) {
                    buildtools.insert(dep.as_str());
                }
            }

            if buildtools.contains(manifest.name.as_str()) {
                for dep in deps
                    .build
                    .iter()
                    .chain(deps.build_export.iter())
                    .chain(deps.exec.iter())
                {
                    if !definetly_not_buildtools.contains(dep.as_str()) {
                        buildtools.insert(dep.as_str());
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
            let mut res = ClassifiedDependencies::default();
            if buildtools.contains(m.name.as_str()) {
                for d in m.dependencies.build.iter() {
                    if both_buildtools_and_runtime.contains(d.as_str()) {
                        res.host_target.insert(d.clone());
                    } else if buildtools.contains(d.as_str()) {
                        res.host_target.insert(d.clone());
                    } else {
                        res.target_target.insert(d.clone());
                    }
                }

                for d in m.dependencies.build_export.iter() {
                    if both_buildtools_and_runtime.contains(d.as_str()) {
                        res.host_target_propagated.insert(d.clone());
                    } else if buildtools.contains(d.as_str()) {
                        res.host_target_propagated.insert(d.clone());
                    } else {
                        res.target_target_propagated.insert(d.clone());
                    }
                }

                for d in m.dependencies.buildtool.iter() {
                    if both_buildtools_and_runtime.contains(d.as_str()) {
                        res.build_host.insert(d.clone());
                    } else if buildtools.contains(d.as_str()) {
                        res.host_target.insert(d.clone());
                    } else {
                        res.target_target.insert(d.clone());
                    }
                }

                for d in m.dependencies.buildtool_export.iter() {
                    if both_buildtools_and_runtime.contains(d.as_str()) {
                        res.build_host_propagated.insert(d.clone());
                    } else if buildtools.contains(d.as_str()) {
                        res.host_target_propagated.insert(d.clone());
                    } else {
                        res.target_target_propagated.insert(d.clone());
                    }
                }

                for d in m.dependencies.exec.iter() {
                    if both_buildtools_and_runtime.contains(d.as_str()) {
                        res.host_target_propagated.insert(d.clone());
                    } else if buildtools.contains(d.as_str()) {
                        res.host_target_propagated.insert(d.clone());
                    } else {
                        res.target_target_propagated.insert(d.clone());
                    }
                }
            } else {
                for d in m.dependencies.build.iter() {
                    if both_buildtools_and_runtime.contains(d.as_str()) {
                        res.host_target.insert(d.clone());
                    } else if buildtools.contains(d.as_str()) {
                        res.build_host.insert(d.clone());
                    } else {
                        res.host_target.insert(d.clone());
                    }
                }

                for d in m.dependencies.build_export.iter() {
                    if both_buildtools_and_runtime.contains(d.as_str()) {
                        res.host_target_propagated.insert(d.clone());
                    } else if buildtools.contains(d.as_str()) {
                        res.build_host_propagated.insert(d.clone());
                    } else {
                        res.host_target_propagated.insert(d.clone());
                    }
                }

                for d in m.dependencies.buildtool.iter() {
                    if both_buildtools_and_runtime.contains(d.as_str()) {
                        res.build_host.insert(d.clone());
                    } else if buildtools.contains(d.as_str()) {
                        res.build_host.insert(d.clone());
                    } else {
                        res.host_target.insert(d.clone());
                    }
                }

                for d in m.dependencies.buildtool_export.iter() {
                    if both_buildtools_and_runtime.contains(d.as_str()) {
                        res.build_host_propagated.insert(d.clone());
                    } else if buildtools.contains(d.as_str()) {
                        res.build_host_propagated.insert(d.clone());
                    } else {
                        res.host_target_propagated.insert(d.clone());
                    }
                }

                for d in m.dependencies.exec.iter() {
                    if both_buildtools_and_runtime.contains(d.as_str()) {
                        res.host_target_propagated.insert(d.clone());
                    } else if buildtools.contains(d.as_str()) {
                        res.build_host_propagated.insert(d.clone());
                    } else {
                        res.host_target_propagated.insert(d.clone());
                    }
                }
            }

            for group in m.dependencies.group_depend.iter() {
                if let Some(members) = groups.get(group) {
                    for d in members.iter() {
                        res.host_target.insert(d.clone());
                    }
                }
            }

            res.build_host = &res.build_host - &res.build_host_propagated;
            res.host_target = &res.host_target - &res.host_target_propagated;
            res.target_target = &res.target_target - &res.target_target_propagated;
            (m.name.clone(), res)
        })
        .collect())
}
