use std::{collections::BTreeMap, sync::Arc};

use anyhow::Result;
use autopatch::{autopatch_source, PatchedSource};
use deps::resolve_dependencies;
use futures::{future, stream, StreamExt as _, TryStreamExt};
use rosindex::{DistroIndex, DistroStatus, PackageIndex};
use source::{Fetcher, Source};
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
    fetcher: &Arc<Fetcher>,
    pkg_index: &PackageIndex,
) -> Result<BTreeMap<String, Source>> {
    let max_concurrent_downloads = fetcher.max_concurrent_downloads();
    let sources: BTreeMap<String, Source> = stream::iter(pkg_index.manifests.iter())
        .map(move |(name, manifest)| {
            let fetcher = fetcher.clone();
            let manifest = manifest.clone();
            let name = name.clone();
            tokio::spawn(async move {
                (
                    name.clone(),
                    fetcher
                        .fetch_git(name.as_str(), &manifest.repository, &manifest.tag)
                        .await,
                )
            })
        })
        .buffer_unordered(max_concurrent_downloads)
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
        let fetcher = Fetcher::new_arc(&cfg, &package_index.name);
        if package_index.status != DistroStatus::Active {
            continue;
        }
        if package_index.name != "jazzy" {
            continue;
        }
        let sources = fetch_sources(&fetcher, package_index).await?;
        let deps = resolve_dependencies(&cfg, &package_index.manifests)?;
        let patched_sources: BTreeMap<String, PatchedSource> = stream::iter(sources.iter())
            .map(|(name, src)| {
                let name = name.clone();
                let src = src.clone();
                let fetcher = fetcher.clone();
                tokio::spawn(async move {
                    let patched = autopatch_source(&fetcher, &src).await?;
                    anyhow::Ok((name.clone(), patched))
                })
            })
            .buffer_unordered(fetcher.max_concurrent_downloads())
            .then(|res| future::ready(res.unwrap()))
            .try_collect()
            .await?;
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
