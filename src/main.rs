use std::collections::BTreeMap;

use anyhow::Result;
use config::ConfigRef;
use futures::{stream, StreamExt as _};
use log::warn;
use rosindex::{DistroIndex, DistroStatus, PackageIndex};
use source::{Source, SourceCache};
use tokio::select;

mod condition;
mod config;
mod rosindex;
mod source;

pub async fn fetch_packages(
    cfg: &ConfigRef,
    pkg_index: &PackageIndex,
) -> Result<BTreeMap<String, Source>> {
    let cache = SourceCache::new_arc(cfg, &pkg_index.name);
    let sources: BTreeMap<String, Result<Source>> = stream::iter(pkg_index.manifests.iter())
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
        .map(|res| {
            let (name, maybe_src) = res.unwrap();
            if let Err(ref err) = maybe_src {
                warn!("fetch error: {err}");
            }
            (name, maybe_src)
        })
        .collect()
        .await;
    todo!()
}

async fn main_inner() -> Result<()> {
    let cfg = config::Config::new().into_ref();
    let distro_index = DistroIndex::fetch(&cfg).await?;
    for package_index in distro_index.distros.values() {
        if package_index.status != DistroStatus::Active {
            continue;
        }
        fetch_packages(&cfg, package_index).await?;
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
