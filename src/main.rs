use std::{collections::BTreeMap, sync::Arc};

use anyhow::Result;
use autopatch::{autopatch_source, PatchedSource};
use deps::resolve_dependencies;
use futures::{future, stream, StreamExt as _, TryStreamExt};
use indicatif::ProgressStyle;
use rosindex::{DistroIndex, DistroStatus, PackageIndex};
use source::Fetcher;
use tokio::select;
use tracing::info_span;
use tracing::level_filters::LevelFilter;
use tracing_indicatif::IndicatifLayer;
use tracing_subscriber::layer::SubscriberExt;
use tracing_subscriber::util::SubscriberInitExt;
use tracing_subscriber::Layer;

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
) -> Result<BTreeMap<String, PatchedSource>> {
    let span = info_span!("fetch_sources", distro = %pkg_index.name);
    let _enter = span.enter();
    let max_concurrent_downloads = fetcher.max_concurrent_downloads();
    let sources: BTreeMap<String, PatchedSource> = stream::iter(pkg_index.manifests.iter())
        .map(move |(name, manifest)| {
            let fetcher = fetcher.clone();
            let manifest = manifest.clone();
            let name = name.clone();
            tokio::spawn(async move {
                let src = fetcher
                    .fetch_git(name.as_str(), &manifest.repository, &manifest.tag)
                    .await?;
                let patched = autopatch_source(&fetcher, &src).await?;
                anyhow::Ok((name.clone(), patched))
            })
        })
        .buffer_unordered(max_concurrent_downloads)
        .then(|res| future::ready(res.unwrap()))
        .try_collect()
        .await?;
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
        let deps = resolve_dependencies(&cfg, &package_index.manifests)?;
        let patched_sources = fetch_sources(&fetcher, package_index).await?;
        nixgen::generate(&cfg, package_index, &patched_sources, &deps)?;
    }

    Ok(())
}

#[tokio::main]
async fn main() -> Result<()> {
    let indicatif_layer = IndicatifLayer::new().with_max_progress_bars(
        64,
        Some(ProgressStyle::with_template(
            "{pending_progress_bars} more..",
        )?),
    );

    tracing_subscriber::registry()
        .with(
            tracing_subscriber::fmt::layer()
                .with_writer(indicatif_layer.get_stderr_writer())
                .with_filter(LevelFilter::INFO),
        )
        .with(indicatif_layer)
        .init();

    select! {
        res = main_inner() => res,
        _ = tokio::signal::ctrl_c() => anyhow::bail!("ctrl-c"),
    }
}
