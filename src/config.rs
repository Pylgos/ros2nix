use std::{
    collections::{BTreeMap, BTreeSet},
    path::{Path, PathBuf},
    sync::Arc,
};

use anyhow::Result;
use serde::Deserialize;

#[derive(Debug, Deserialize)]
pub struct Config {
    #[serde(default = "default_cache_dir")]
    cache_dir: PathBuf,
    #[serde(default = "default_gen_dir")]
    gen_dir: PathBuf,
    #[serde(default)]
    env: BTreeMap<String, BTreeMap<String, String>>,
    #[serde(default)]
    system_packages: BTreeMap<String, Vec<String>>,
    #[serde(default = "default_max_concurrent_downloads")]
    max_concurrent_downloads: usize,
    #[serde(default)]
    buildtool_packages: BTreeSet<String>,
    #[serde(default)]
    runtime_packages: BTreeSet<String>,
    #[serde(default)]
    buildtool_groups: BTreeSet<String>,
    #[serde(default)]
    runtime_groups: BTreeSet<String>,
    #[serde(default)]
    hybrid_packages: BTreeSet<String>,
}

fn default_cache_dir() -> PathBuf {
    "cache".into()
}
fn default_gen_dir() -> PathBuf {
    "nix/gen".into()
}
fn default_max_concurrent_downloads() -> usize {
    32
}

pub type ConfigRef = std::sync::Arc<Config>;

impl Default for Config {
    fn default() -> Self {
        Self {
            cache_dir: PathBuf::from("cache"),
            gen_dir: PathBuf::from("nix/gen"),
            env: BTreeMap::new(),
            system_packages: BTreeMap::new(),
            max_concurrent_downloads: 32,
            buildtool_packages: Default::default(),
            runtime_packages: Default::default(),
            buildtool_groups: Default::default(),
            runtime_groups: Default::default(),
            hybrid_packages: Default::default(),
        }
    }
}

impl Config {
    pub fn load(path: impl AsRef<Path>) -> Result<Config> {
        Ok(toml::from_str(&std::fs::read_to_string(path.as_ref())?)?)
    }

    pub fn into_ref(self) -> ConfigRef {
        Arc::new(self)
    }

    pub fn create_directories(&self) -> std::io::Result<()> {
        std::fs::create_dir_all(&self.cache_dir)?;
        std::fs::create_dir_all(&self.gen_dir)?;
        Ok(())
    }

    pub fn cache_dir(&self) -> &Path {
        &self.cache_dir
    }

    pub fn gen_dir(&self) -> &Path {
        &self.gen_dir
    }

    pub fn env(&self) -> &BTreeMap<String, BTreeMap<String, String>> {
        &self.env
    }

    pub fn system_packages(&self) -> &BTreeMap<String, Vec<String>> {
        &self.system_packages
    }

    pub fn max_concurrent_downloads(&self) -> usize {
        self.max_concurrent_downloads
    }

    pub fn buildtool_packages(&self) -> &BTreeSet<String> {
        &self.buildtool_packages
    }

    pub fn runtime_packages(&self) -> &BTreeSet<String> {
        &self.runtime_packages
    }

    pub fn buildtool_groups(&self) -> &BTreeSet<String> {
        &self.buildtool_groups
    }

    pub fn runtime_groups(&self) -> &BTreeSet<String> {
        &self.runtime_groups
    }

    pub fn hybrid_packages(&self) -> &BTreeSet<String> {
        &self.hybrid_packages
    }
}
