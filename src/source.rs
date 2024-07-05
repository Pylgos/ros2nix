use std::path::{Path, PathBuf};

use anyhow::{ensure, Result};
use serde::Deserialize;
use tokio::process::Command;

#[derive(Debug, Clone)]
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

#[derive(Debug, Clone)]
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

        let output = Command::new("nix-prefetch-git")
            .arg("--url")
            .arg(url)
            .arg("--rev")
            .arg(rev_or_branch)
            .arg("--fetch-submodules")
            .arg("--quiet")
            .output()
            .await?;
        let out: Out = if output.status.success() {
            let stdout = String::from_utf8(output.stdout)?;
            serde_json::from_str(&stdout)?
        } else {
            let output = Command::new("nix-prefetch-git")
                .arg("--url")
                .arg(url)
                .arg("--rev")
                .arg("refs/heads/".to_string() + rev_or_branch)
                .arg("--fetch-submodules")
                .arg("--quiet")
                .output()
                .await?;
            ensure!(output.status.success());
            let stdout = String::from_utf8(output.stdout)?;
            serde_json::from_str(&stdout)?
        };
        Ok(Source {
            url: url.to_string(),
            path: out.path,
            nar_hash: out.hash,
            kind: SourceKind::Git { rev: out.rev },
        })
    }
}

#[cfg(test)]
mod test {
    use super::*;

    #[tokio::test]
    async fn test_fetch_git() {
        let url = "https://github.com/ros2-gbp/acado_vendor-release.git";
        Source::fetch_git(url, "master").await.unwrap();
        Source::fetch_git(url, "release/jazzy/acado_vendor/1.0.0-7")
            .await
            .unwrap();
        Source::fetch_git(url, "aaaaaaaa").await.unwrap_err();
    }
}
