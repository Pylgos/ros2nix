use anyhow::Result;
use std::collections::BTreeMap;
use std::io::Write;

use crate::{config::ConfigRef, rosindex::PackageIndex, source::Source};

pub fn generate_distro_root(
    cfg: &ConfigRef,
    package_index: &PackageIndex,
    sources: &BTreeMap<String, Source>,
) -> Result<()> {
    let dst = cfg.gen_dir().join(package_index.name.to_string() + ".nix");
    let mut file = std::fs::File::create(&dst)?;
    writeln!(file, "final: prev:")?;
    writeln!(file, "{{")?;

    writeln!(file, "}}")?;
    Ok(())
}

pub fn generate(
    cfg: &ConfigRef,
    package_index: &PackageIndex,
    sources: &BTreeMap<String, Source>,
) -> Result<()> {
    generate_distro_root(cfg, package_index, sources)?;
    Ok(())
}
