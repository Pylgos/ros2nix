use anyhow::Result;
use std::collections::BTreeMap;
use std::io::Write;

use crate::{config::ConfigRef, deps::Dependencies, rosindex::PackageIndex, source::Source};

struct Ctx<'a> {
    cfg: &'a ConfigRef,
    package_index: &'a PackageIndex,
    sources: &'a BTreeMap<String, Source>,
    deps: &'a BTreeMap<String, Dependencies>,
}

pub fn generate_distro_root(ctx: &Ctx) -> Result<()> {
    let dst = ctx
        .cfg
        .gen_dir()
        .join(ctx.package_index.name.to_string() + ".nix");
    let mut file = std::fs::File::create(&dst)?;
    writeln!(file, "final: prev:")?;
    writeln!(file, "{{")?;
    for (name, manifest) in ctx.package_index.manifests.iter() {
        let Some(deps) = ctx.deps.get(name) else { continue; };
        let src = ctx.sources.get(name).unwrap();
        writeln!(file, "  {name} = final.callPackage;")?;
    }
    writeln!(file, "}}")?;
    Ok(())
}

pub fn generate(
    cfg: &ConfigRef,
    package_index: &PackageIndex,
    sources: &BTreeMap<String, Source>,
    deps: &BTreeMap<String, Dependencies>,
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
