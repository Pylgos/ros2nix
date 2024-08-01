use anyhow::Result;
use clap::Parser;
use indicatif::ProgressStyle;
use std::{collections::BTreeMap, sync::Arc};
use tokio::{process::Command, select};
use tracing::error;
use tracing::level_filters::LevelFilter;
use tracing_indicatif::IndicatifLayer;
use tracing_subscriber::layer::SubscriberExt;
use tracing_subscriber::util::SubscriberInitExt;
use tracing_subscriber::Layer;

use crate::{
    autopatch::{autopatch_source, PatchedSource},
    config::ConfigRef,
    deps::resolve_dependencies,
    rosindex::{DistroIndex, DistroStatus, PackageIndex},
    source::Fetcher,
};
use futures::{future, stream, StreamExt, TryStreamExt};
use tracing::info_span;
use tracing::Span;
use tracing_indicatif::span_ext::IndicatifSpanExt;

mod autopatch;
mod condition;
mod config;
mod deps;
mod nixgen;
mod rosindex;
mod source;

#[derive(Debug, Parser)]
enum Subcommand {
    Generate,
    CheckConfig,
}

#[derive(Debug, Parser)]
struct Args {
    #[command(subcommand)]
    subcommand: Subcommand,
}

async fn main_inner() -> Result<()> {
    let args = Args::parse();
    let cfg = config::Config::load("ros2nix.toml")?.into_ref();
    cfg.create_directories()?;
    match args.subcommand {
        Subcommand::Generate => {
            generate(&cfg).await?;
        }
        Subcommand::CheckConfig => {
            check_config(&cfg).await?;
        }
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

pub async fn check_config(cfg: &ConfigRef) -> Result<()> {
    let span = info_span!("check_config");
    let pairs = cfg
        .system_packages()
        .iter()
        .flat_map(|(ros_name, nix_names)| {
            nix_names
                .iter()
                .map(|nix_name| (ros_name.clone(), nix_name.clone()))
        })
        .collect::<Vec<_>>();
    span.pb_set_style(&ProgressStyle::default_bar());
    span.pb_set_length(pairs.len() as _);
    let _enter = span.enter();
    stream::iter(pairs)
        .map(|(ros_name, nix_name)| {
            let span = Span::current();
            tokio::spawn(async move {
                let result = can_evaluate_out_path(&format!("default.{nix_name}")).await?;
                if result != EvalResult::Success {
                    error!(
                        ros_name = %ros_name,
                        nix_name = %nix_name,
                        reason = ?result,
                        "evaluation error",
                    );
                }
                span.pb_inc(1);
                anyhow::Ok(())
            })
        })
        .buffer_unordered(num_cpus::get())
        .try_for_each(|_| async { Ok(()) })
        .await?;
    Ok(())
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum EvalResult {
    Success,
    NotFound,
    Removed,
    UnsupportedPlatform,
    Insecure,
    Unfree,
    UnknownError(String),
}

pub async fn can_evaluate_out_path(pkg: &str) -> Result<EvalResult> {
    let output = Command::new("nix")
        .arg("eval")
        .arg(format!(".#{pkg}.outPath"))
        .output()
        .await?;
    let err = String::from_utf8_lossy(&output.stderr);
    if output.status.success() {
        Ok(EvalResult::Success)
    } else if err.contains("has been removed") {
        Ok(EvalResult::Removed)
    } else if err.contains("does not provide attribute") {
        Ok(EvalResult::NotFound)
    } else if err.contains("is not available on the requested hostPlatform") {
        Ok(EvalResult::UnsupportedPlatform)
    } else if err.contains("is marked as insecure") {
        Ok(EvalResult::Insecure)
    } else if err.contains("has an unfree license") {
        Ok(EvalResult::Unfree)
    } else {
        Ok(EvalResult::UnknownError(err.to_string()))
    }
}
