use anyhow::Result;
use clap::Parser;
use indicatif::ProgressStyle;
use tokio::select;
use tracing::error;
use tracing::level_filters::LevelFilter;
use tracing_indicatif::IndicatifLayer;
use tracing_subscriber::layer::SubscriberExt;
use tracing_subscriber::util::SubscriberInitExt;
use tracing_subscriber::Layer;

mod autopatch;
mod condition;
mod config;
mod deps;
mod generate;
mod nixgen;
mod rosindex;
mod source;

#[derive(Debug, Parser)]
enum Subcommand {
    Generate,
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
            generate::generate(&cfg).await?;
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
