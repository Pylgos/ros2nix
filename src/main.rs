use std::{collections::BTreeMap, sync::Arc};

use crate::{
    autopatch::{autopatch_source, PatchedSource},
    deps::resolve_dependencies,
    rosindex::{DistroIndex, DistroStatus, PackageIndex},
    source::Fetcher,
};
use anyhow::Result;
use futures::{future, stream, StreamExt as _, TryStreamExt};
use indicatif::ProgressStyle;
use tokio::select;
use tracing::{error, info_span};
use tracing::{level_filters::LevelFilter, Span};
use tracing_indicatif::{span_ext::IndicatifSpanExt, IndicatifLayer};
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
    span.pb_set_style(&ProgressStyle::default_bar());
    span.pb_set_length(pkg_index.manifests.len() as _);
    span.pb_set_position(1);
    let _enter = span.enter();
    let max_concurrent_downloads = fetcher.max_concurrent_downloads();
    let sources: BTreeMap<String, PatchedSource> = stream::iter(pkg_index.manifests.iter())
        .map(move |(name, manifest)| {
            let fetcher = fetcher.clone();
            let manifest = manifest.clone();
            let name = name.clone();
            let span = Span::current();
            tokio::spawn(async move {
                let src = fetcher
                    .fetch_git(name.as_str(), &manifest.repository, &manifest.tag)
                    .await?;
                let patched = autopatch_source(&fetcher, &src).await?;
                span.pb_inc(1);
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
    let fetcher = Fetcher::new_arc(&cfg, "common");
    for package_index in distro_index.distros.values() {
        if package_index.status == DistroStatus::EndOfLife {
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
        res = main_inner() => {
            if let Err(e) = &res {
                error!("{:?}", e);
            }
            res
        },
        _ = tokio::signal::ctrl_c() => anyhow::bail!("ctrl-c"),
    }
}
