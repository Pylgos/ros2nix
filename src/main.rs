use std::collections::BTreeMap;

use anyhow::Result;
use config::ConfigRef;
use futures::{future, stream, StreamExt as _};
use log::warn;
use rosindex::{DistroIndex, DistroStatus, PackageIndex};
use source::{Source, SourceCache};
use tokio::select;

mod condition;
mod config;
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
                    name,
                    cache.fetch_git(&manifest.repository, &manifest.tag).await,
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
    let cfg = config::Config::new().into_ref();
    let distro_index = DistroIndex::fetch(&cfg).await?;
    for package_index in distro_index.distros.values() {
        if package_index.status != DistroStatus::Active {
            continue;
        }
        let sources = fetch_sources(&cfg, package_index).await?;
    }

    Ok(())
}

#[tokio::main]
async fn main() -> Result<()> {
    env_logger::init();

    select! {
        _ = main_inner() => {}
        _ = tokio::signal::ctrl_c() => {}
    }

    Ok(())
}
