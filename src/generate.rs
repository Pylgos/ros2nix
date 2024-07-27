use std::{collections::BTreeMap, sync::Arc};

use crate::{
    autopatch::{autopatch_source, PatchedSource},
    config::ConfigRef,
    deps::resolve_dependencies,
    nixgen,
    rosindex::{DistroIndex, DistroStatus, PackageIndex},
    source::Fetcher,
};
use anyhow::Result;
use futures::{future, stream, StreamExt as _, TryStreamExt};
use indicatif::ProgressStyle;
use tracing::info_span;
use tracing::Span;
use tracing_indicatif::span_ext::IndicatifSpanExt;

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

pub async fn generate(cfg: &ConfigRef) -> Result<()> {
    let distro_index = DistroIndex::fetch(cfg).await?;
    let fetcher = Fetcher::new_arc(cfg, "common");
    for package_index in distro_index.distros.values() {
        if package_index.status == DistroStatus::EndOfLife {
            continue;
        }
        if package_index.name != "jazzy" {
            continue;
        }
        let deps = resolve_dependencies(cfg, &package_index.manifests)?;
        let patched_sources = fetch_sources(&fetcher, package_index).await?;
        nixgen::generate(cfg, package_index, &patched_sources, &deps)?;
    }

    Ok(())
}
