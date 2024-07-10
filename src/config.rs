use std::{
    collections::HashMap,
    path::{Path, PathBuf},
    sync::Arc,
};

use anyhow::{anyhow, Result};
use serde::Deserialize;

#[derive(Debug, Deserialize)]
struct ConfigToml {
    cache_dir: Option<String>,
    gen_dir: Option<String>,
    env: Option<HashMap<String, HashMap<String, String>>>,
    system_packages: Option<HashMap<String, Vec<String>>>,
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
        }
    }
}

#[derive(Debug)]
pub struct Config {
    cache_dir: PathBuf,
    gen_dir: PathBuf,
    env: HashMap<String, HashMap<String, String>>,
    system_packages: HashMap<String, Vec<String>>,
}

pub type ConfigRef = std::sync::Arc<Config>;

impl Config {
    pub fn new() -> Config {
        Self {
            cache_dir: PathBuf::from("cache"),
            gen_dir: PathBuf::from("nix/gen"),
            env: HashMap::new(),
            system_packages: HashMap::new(),
        }
    }

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

    pub fn env(&self) -> &HashMap<String, HashMap<String, String>> {
        &self.env
    }

    pub fn system_packages(&self) -> &HashMap<String, Vec<String>> {
        &self.system_packages
    }
}
