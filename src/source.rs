use std::{
    collections::BTreeMap,
    fs::File,
    io::Stderr,
    path::{Path, PathBuf},
    process::{Output, Stdio},
    sync::Arc,
};

use anyhow::{ensure, Result};
use futures::{stream, StreamExt};
use serde::{Deserialize, Serialize};
use tokio::{
    process::{Child, Command},
    sync::Mutex,
};
use tokio_util::codec::{FramedRead, LinesCodec};
use tracing::{debug, info, warn};

use crate::{config::ConfigRef, rosindex::PackageIndex};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Source {
    url: String,
    path: PathBuf,
    nar_hash: String,
    kind: SourceKind,
}

impl Source {
    pub fn url(&self) -> &str {
        &self.url
    }

    pub fn path(&self) -> &Path {
        &self.path
    }

    pub fn nar_hash(&self) -> &str {
        &self.nar_hash
    }

    pub fn kind(&self) -> &SourceKind {
        &self.kind
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum SourceKind {
    Git { rev: String },
}

impl Source {
    pub async fn fetch_url() -> Result<Self> {
        Command::new("nix-prefetch-url").arg("");
        todo!()
    }

    pub async fn fetch_git(url: &str, rev_or_branch: &str) -> Result<Self> {
        #[derive(Debug, Deserialize)]
        struct Out {
            rev: String,
            path: PathBuf,
            hash: String,
        }

        debug!("fetching git repository {} {}", url, rev_or_branch);
        let child = Command::new("nix-prefetch-git")
            .arg("--url")
            .arg(url)
            .arg("--rev")
            .arg(rev_or_branch)
            .arg("--fetch-submodules")
            .stderr(Stdio::piped())
            .stdout(Stdio::piped())
            .stdin(Stdio::null())
            .spawn()?;
        let output = wait_and_get_output(child).await?;
        let out: Out = if output.status.success() {
            let stdout = String::from_utf8(output.stdout)?;
            serde_json::from_str(&stdout)?
        } else {
            let child = Command::new("nix-prefetch-git")
                .arg("--url")
                .arg(url)
                .arg("--rev")
                .arg("refs/heads/".to_string() + rev_or_branch)
                .arg("--fetch-submodules")
                .stderr(Stdio::piped())
                .stdout(Stdio::piped())
                .stdin(Stdio::null())
                .spawn()?;
            let output = wait_and_get_output(child).await?;
            ensure!(output.status.success());
            let stdout = String::from_utf8(output.stdout)?;
            serde_json::from_str(&stdout)?
        };
        info!(
            "git repository fetched {url} {rev_or_branch} {}",
            out.path.to_string_lossy()
        );
        Ok(Source {
            url: url.to_string(),
            path: out.path,
            nar_hash: out.hash,
            kind: SourceKind::Git { rev: out.rev },
        })
    }
}

async fn wait_and_get_output(mut child: Child) -> Result<Output> {
    let stderr = child.stderr.take().unwrap();
    let mut reader = FramedRead::new(stderr, LinesCodec::new());
    tokio::task::spawn(async move {
        while let Some(Ok(line)) = reader.next().await {
            debug!("{}", line);
        }
    });
    Ok(child.wait_with_output().await?)
}

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
struct SourceCacheData {
    git_caches: BTreeMap<String, Source>,
}

impl SourceCacheData {
    fn load(path: &Path) -> Result<Self> {
        let file = File::open(path)?;
        Ok(serde_json::from_reader(file)?)
    }

    fn save(&self, path: &Path) -> Result<()> {
        let file = File::create(path)?;
        serde_json::to_writer_pretty(file, self)?;
        Ok(())
    }
}

#[derive(Debug)]
pub struct SourceCache {
    path: PathBuf,
    cache: std::sync::Mutex<SourceCacheData>,
}

impl SourceCache {
    pub fn new(cfg: &ConfigRef, name: &str) -> Self {
        let path = cfg
            .cache_dir()
            .join(name.to_string() + "-source-cache.json");
        let cache = match SourceCacheData::load(&path) {
            Ok(cache) => cache,
            Err(_) => SourceCacheData::default(),
        };
        SourceCache {
            path: path,
            cache: std::sync::Mutex::new(cache),
        }
    }

    pub fn new_arc(cfg: &ConfigRef, name: &str) -> Arc<Self> {
        Arc::new(Self::new(cfg, name))
    }

    pub async fn fetch_git(&self, url: &str, rev_or_branch: &str) -> Result<Source> {
        let key = format!("{url} {rev_or_branch}");
        {
            let cache = self.cache.lock().unwrap();
            match cache.git_caches.get(&key) {
                Some(source) if source.path.exists() => {
                    debug!("cache hit {url} {rev_or_branch}");
                    return Ok(source.clone());
                }
                _ => {}
            }
        }
        let source = Source::fetch_git(url, rev_or_branch).await?;
        let mut cache = self.cache.lock().unwrap();
        cache.git_caches.insert(key, source.clone());
        Ok(source)
    }

    pub fn save(&self) -> Result<()> {
        let cache = self.cache.lock().unwrap();
        cache.save(&self.path)?;
        Ok(())
    }
}

impl Drop for SourceCache {
    fn drop(&mut self) {
        match self.save() {
            Ok(_) => {
                info!(
                    "source cache saved to {path}",
                    path = self.path.to_string_lossy()
                );
            }
            Err(err) => {
                warn!("failed to save source cache: {}", err);
            }
        }
    }
}

#[cfg(test)]
mod test {
    use super::*;

    #[tokio::test]
    async fn test_fetch_git() {
        tracing_subscriber::fmt::init();
        let url = "https://github.com/ros2-gbp/acado_vendor-release.git";
        Source::fetch_git(url, "master").await.unwrap();
        Source::fetch_git(url, "release/jazzy/acado_vendor/1.0.0-7")
            .await
            .unwrap();
        Source::fetch_git(url, "aaaaaaaa").await.unwrap_err();
    }
}
