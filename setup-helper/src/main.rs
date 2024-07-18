use std::path::PathBuf;


const AMENT_PREFIX_PATH: &str = "AMENT_PREFIX_PATH";

fn get_ament_prefix_paths() -> Vec<PathBuf> {
    let ament_prefix_path = std::env::var(AMENT_PREFIX_PATH).unwrap();
    ament_prefix_path.split(":").map(|s| s.into()).collect()
}

fn main() {
    
}
