use anyhow::Result;
use indenter::indented;
use std::collections::{BTreeMap, BTreeSet};
use std::fmt::Write;
use std::io::Write as _;

use crate::autopatch::{PatchedSource, Replacement};
use crate::deps::{NixDependency, NixDependencyKind};
use crate::source::SourceKind;
use crate::{
    config::ConfigRef,
    deps::NixDependencies,
    rosindex::{PackageIndex, PackageManifest},
};

struct Ctx<'a> {
    cfg: &'a ConfigRef,
    package_index: &'a PackageIndex,
    sources: &'a BTreeMap<String, PatchedSource>,
    deps: &'a BTreeMap<String, NixDependencies>,
}

fn spliced_set_name(kind: NixDependencyKind) -> Option<&'static str> {
    use NixDependencyKind::*;
    match kind {
        HostTarget => None,
        BuildHost => Some("buildPackages"),
        TargetTarget => Some("pkgsTargetTarget"),
        Check => None,
    }
}

fn escape(s: &str) -> String {
    let mut escaped = String::new();
    escaped.push('"');
    let mut chars = s.chars().peekable();
    while let Some(c) = chars.next() {
        let maybe_next = chars.peek();
        match c {
            '$' if maybe_next == Some(&'{') => {
                escaped.push_str("\\$");
            }
            '\\' => escaped.push_str("\\\\"),
            '"' => escaped.push_str("\\\""),
            _ => escaped.push(c),
        }
    }
    escaped.push('"');
    escaped
}

fn quote(s: &str) -> String {
    format!("\"{}\"", s)
}

fn generate_parameters(ctx: &Ctx, mut dst: impl Write, manifest: &PackageManifest) -> Result<()> {
    let mut params: BTreeSet<_> = ctx.deps[&manifest.name]
        .iter()
        .map(|dep| match spliced_set_name(dep.kind) {
            Some(set_name) if dep.name.contains('.') => set_name,
            _ => dep.name.split('.').next().unwrap(),
        })
        .collect();
    params.insert("buildRosPackage");
    writeln!(dst, "{{")?;
    for param in params {
        writeln!(dst, "  {param},")?;
    }
    writeln!(dst, "}}:")?;
    Ok(())
}

fn generate_package_body(ctx: &Ctx, mut dst: impl Write, manifest: &PackageManifest) -> Result<()> {
    writeln!(dst, "pname = {};", escape(&manifest.name))?;
    writeln!(dst, "version = {};", escape(&manifest.release_version))?;
    writeln!(
        dst,
        "src = sources.{};",
        ctx.sources[&manifest.name].name()
    )?;
    let deps = &ctx.deps[&manifest.name];
    let dep_string_of_kind = |kind: NixDependencyKind, propagated: bool| -> String {
        deps.iter()
            .filter(|dep| dep.kind == kind && dep.propagated == propagated)
            .map(|dep: &NixDependency| -> String {
                match spliced_set_name(dep.kind) {
                    Some(set_name) if dep.name.contains('.') => {
                        format!("{set_name}.{}", dep.name)
                    }
                    _ => dep.name.clone(),
                }
            })
            .collect::<Vec<_>>()
            .join(" ")
    };
    writeln!(
        dst,
        "nativeBuildInputs = [ {} ];",
        dep_string_of_kind(NixDependencyKind::BuildHost, false)
    )?;
    writeln!(
        dst,
        "propagatedNativeBuildInputs = [ {} ];",
        dep_string_of_kind(NixDependencyKind::BuildHost, true)
    )?;
    writeln!(
        dst,
        "buildInputs = [ {} ];",
        dep_string_of_kind(NixDependencyKind::HostTarget, false)
    )?;
    writeln!(
        dst,
        "propagatedBuildInputs = [ {} ];",
        dep_string_of_kind(NixDependencyKind::HostTarget, true)
    )?;
    writeln!(
        dst,
        "depsTargetTarget = [ {} ];",
        dep_string_of_kind(NixDependencyKind::TargetTarget, false)
    )?;
    writeln!(
        dst,
        "depsTargetTargetPropagated = [ {} ];",
        dep_string_of_kind(NixDependencyKind::TargetTarget, true)
    )?;
    Ok(())
}

fn generate_package(ctx: &Ctx, mut dst: impl Write, manifest: &PackageManifest) -> Result<()> {
    generate_parameters(ctx, &mut dst, manifest)?;
    writeln!(dst, "buildRosPackage {{")?;
    generate_package_body(ctx, indented(&mut dst).with_str("  "), manifest)?;
    writeln!(dst, "}}")?;
    Ok(())
}

fn generate_package_list(ctx: &Ctx, mut dst: impl Write) -> Result<()> {
    for (name, manifest) in ctx.package_index.manifests.iter() {
        if !ctx.deps.contains_key(name) {
            continue;
        };
        writeln!(dst, "{name} = self.callPackage (")?;
        generate_package(ctx, indented(&mut dst).with_str("  "), manifest)?;
        writeln!(dst, ") {{}};")?;
    }
    Ok(())
}

fn collect_sources<'a>(dst: &mut BTreeMap<String, &'a PatchedSource>, src: &'a PatchedSource) {
    dst.insert(src.name().to_string(), &src);
    for sub in src.substitutions.iter() {
        match &sub.with {
            Replacement::Path(src) => collect_sources(dst, src),
            Replacement::Url(src) => collect_sources(dst, src),
        }
    }

}

fn generate_source_list(ctx: &Ctx, mut dst: impl Write) -> Result<()> {
    let mut all_srcs = BTreeMap::new();
    for src in ctx.sources.values() {
        collect_sources(&mut all_srcs, src);
    }

    for src in all_srcs.values() {
        let drv_name = src.name().to_string() + "-source";
        writeln!(dst, "{} = substituteSource {{", src.name())?;
        write!(dst, "  src = ")?;
        match src.source.kind() {
            SourceKind::Git { rev } => {
                writeln!(dst, "fetchgit {{")?;
                writeln!(dst, "    name = {};", escape(&drv_name))?;
                writeln!(dst, "    url = {};", escape(src.source.url()))?;
                writeln!(dst, "    rev = {};", escape(rev))?;
                writeln!(dst, "    hash = {};", escape(src.source.nar_hash()))?;
                writeln!(dst, "  }};")?;
            }
        }
        writeln!(dst, "  substitutions = [")?;
        for sub in src.substitutions.iter() {
            writeln!(dst, "    {{")?;
            writeln!(dst, "      path = {};", escape(sub.path.to_str().unwrap()))?;
            writeln!(dst, "      from = {};", escape(&sub.from))?;
            match &sub.with {
                Replacement::Path(with_src) => {
                    writeln!(dst, "      to = {};", quote(&format!("PATH ${{{}}}", with_src.name())))?;
                }
                Replacement::Url(with_src) => {
                    writeln!(dst, "      to = {};", quote(&format!("URL ${{{}}}", with_src.name())))?;
                }
            }
            writeln!(dst, "    }}")?;
        }
        writeln!(dst, "  ];")?;
        writeln!(dst, "}};")?;
    }

    Ok(())
}

fn generate_distro_root(ctx: &Ctx) -> Result<()> {
    let mut dst = String::new();
    writeln!(dst, "self:")?;
    writeln!(dst, "let")?;
    writeln!(
        dst,
        "  sources = self.callPackage ({{ fetchzip, fetchgit, substituteSource }}: rec {{"
    )?;
    generate_source_list(ctx, indented(&mut dst).with_str("    "))?;
    writeln!(dst, "  }}) {{}};")?;
    writeln!(dst, "in")?;
    writeln!(dst, "{{")?;
    generate_package_list(ctx, indented(&mut dst).with_str("  "))?;
    writeln!(dst, "}}")?;

    let dst_path = ctx
        .cfg
        .gen_dir()
        .join(ctx.package_index.name.to_string() + ".nix");
    let mut file = std::fs::File::create(dst_path)?;
    file.write_all(dst.as_bytes())?;
    Ok(())
}

pub fn generate(
    cfg: &ConfigRef,
    package_index: &PackageIndex,
    sources: &BTreeMap<String, PatchedSource>,
    deps: &BTreeMap<String, NixDependencies>,
) -> Result<()> {
    let ctx = Ctx {
        cfg,
        package_index,
        sources,
        deps,
    };
    generate_distro_root(&ctx)?;
    Ok(())
}
