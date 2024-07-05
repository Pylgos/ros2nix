use anyhow::Result;

mod config;
mod condition;
mod rosindex;
mod source;

#[tokio::main]
async fn main() -> Result<()> {
    // let index = rosindex::fetch_distro_index().await?;
    // println!("{:?}", index);
    
    Ok(())
}