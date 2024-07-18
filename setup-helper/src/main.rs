use anyhow::Result;
use std::{
    collections::{BTreeMap, HashMap, HashSet},
    env, fs,
    path::{Path, PathBuf},
};

#[derive(Debug, Clone)]
struct Package {
    name: String,
    path: PathBuf,
    deps: HashSet<String>,
}

impl Package {
    fn find(search_path: &Path) -> HashMap<String, Package> {
        let mut packages = HashMap::new();
        let pkg_dir = search_path
            .join("share")
            .join("ament_index")
            .join("resource_index")
            .join("packages");
        for entry in std::fs::read_dir(pkg_dir).into_iter().flatten() {
            let Ok(entry) = entry else {
                continue;
            };
            let path = entry.path();
            if path.is_file() {
                let name = path.file_name().unwrap().to_str().unwrap().to_string();
                let deps_file_path = search_path
                    .join("share")
                    .join("colcon-core")
                    .join("packages")
                    .join(&name);
                let deps = fs::read_to_string(deps_file_path)
                    .map(|content| content.split(':').map(String::from).collect())
                    .unwrap_or_default();
                packages.insert(name.clone(), Package { name, path: search_path.to_path_buf(), deps });
            }
        }
        packages
    }

    fn package_dsv(&self) -> PathBuf {
        self.path.join("share").join(&self.name).join("package.dsv")
    }
}

fn main() -> Result<()> {
    let search_path: Vec<_> = env::var("_ROS2NIX_SEARCH_PATH")?
        .split(":")
        .map(PathBuf::from)
        .collect();
    let pkgs: BTreeMap<String, Package> = search_path
        .iter()
        .flat_map(|p| Package::find(p).into_iter())
        .collect();
    eprintln!("{search_path:?}");
    eprintln!("{pkgs:?}");
    Ok(())
}
