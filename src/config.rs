use std::{
    collections::BTreeMap,
    path::{Path, PathBuf},
    sync::Arc,
};

use anyhow::Result;
use serde::Deserialize;

#[derive(Debug, Deserialize)]
struct ConfigToml {
    cache_dir: Option<String>,
    gen_dir: Option<String>,
    env: Option<BTreeMap<String, BTreeMap<String, String>>>,
    system_packages: Option<BTreeMap<String, Vec<String>>>,
    max_concurrent_downloads: Option<usize>,
}

impl ConfigToml {
    fn load(path: &Path) -> Result<Self> {
        let toml = std::fs::read_to_string(path)?;
        toml::from_str(&toml).map_err(Into::into)
    }

    fn into_config(self) -> Config {
        Config {
            cache_dir: self
                .cache_dir
                .map(PathBuf::from)
                .unwrap_or_else(|| PathBuf::from("cache")),
            gen_dir: self
                .gen_dir
                .map(PathBuf::from)
                .unwrap_or_else(|| PathBuf::from("nix/gen")),
            env: self.env.unwrap_or_default(),
            system_packages: self.system_packages.unwrap_or_default(),
            max_concurrent_downloads: self.max_concurrent_downloads.unwrap_or(32),
        }
    }
}

#[derive(Debug)]
pub struct Config {
    cache_dir: PathBuf,
    gen_dir: PathBuf,
    env: BTreeMap<String, BTreeMap<String, String>>,
    system_packages: BTreeMap<String, Vec<String>>,
    max_concurrent_downloads: usize,
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
        }
    }
}

impl Config {
    pub fn load(path: impl AsRef<Path>) -> Result<Config> {
        ConfigToml::load(path.as_ref())
            .map_err(Into::into)
            .map(ConfigToml::into_config)
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
}
