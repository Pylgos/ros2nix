use std::{collections::HashMap, path::{Path, PathBuf}, sync::Arc};

pub struct Config {
    pub cache_dir: PathBuf,
    pub env: HashMap<String, String>,
}

pub type ConfigRef = std::sync::Arc<Config>;

impl Config {
    pub fn new() -> Config {
        Self {
            cache_dir: PathBuf::from("cache"),
            env: HashMap::new(),
        }
    }

    pub fn into_ref(self) -> ConfigRef {
        Arc::new(self)
    }

    pub fn create_directories(&self) -> std::io::Result<()> {
        std::fs::create_dir_all(&self.cache_dir)
    }

    pub fn cache_dir(&self) -> &Path {
        &self.cache_dir
    }

    pub fn env(&self) -> &HashMap<String, String> {
        &self.env
    }
}
