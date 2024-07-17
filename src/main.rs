use std::collections::BTreeMap;

use anyhow::Result;
use autopatch::autopatch_source;
use config::ConfigRef;
use deps::resolve_dependencies;
use futures::{future, stream, StreamExt as _};
use rosindex::{DistroIndex, DistroStatus, PackageIndex};
use source::{Source, SourceCache};
use tokio::select;
use tracing::warn;

mod autopatch;
mod condition;
mod config;
mod deps;
mod nixgen;
mod rosindex;
mod source;

pub async fn fetch_sources(
    cfg: &ConfigRef,
    pkg_index: &PackageIndex,
) -> Result<BTreeMap<String, Source>> {
    let cache = SourceCache::new_arc(cfg, &pkg_index.name);
    let sources: BTreeMap<String, Source> = stream::iter(pkg_index.manifests.iter())
        .map(move |(name, manifest)| {
            let cache = cache.clone();
            let manifest = manifest.clone();
            let name = name.clone();
            tokio::spawn(async move {
                (
                    name.clone(),
                    cache
                        .fetch_git(name.as_str(), &manifest.repository, &manifest.tag)
                        .await,
                )
            })
        })
        .buffer_unordered(32)
        .filter_map(|res| {
            let (name, maybe_src) = res.unwrap();
            match maybe_src {
                Ok(src) => future::ready(Some((name, src))),
                Err(err) => {
                    warn!("fetch error: {err}");
                    future::ready(None)
                }
            }
        })
        .collect()
        .await;
    Ok(sources)
}

async fn main_inner() -> Result<()> {
    let cfg = config::Config::load("ros2nix.toml")?.into_ref();
    cfg.create_directories()?;
    let distro_index = DistroIndex::fetch(&cfg).await?;
    for package_index in distro_index.distros.values() {
        if package_index.status != DistroStatus::Active {
            continue;
        }
        if package_index.name != "jazzy" {
            continue;
        }
        let sources = fetch_sources(&cfg, package_index).await?;
        let deps = resolve_dependencies(&cfg, &package_index.manifests)?;
        let patched_sources = sources
            .iter()
            .map(|(name, src)| (name.clone(), autopatch_source(src)))
            .collect();
        nixgen::generate(&cfg, package_index, &patched_sources, &deps)?;
    }

    Ok(())
}

#[tokio::main]
async fn main() -> Result<()> {
    tracing_subscriber::fmt()
        .with_max_level(tracing::Level::DEBUG)
        .init();

    select! {
        res = main_inner() => res,
        _ = tokio::signal::ctrl_c() => anyhow::bail!("ctrl-c"),
    }
}
