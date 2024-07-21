use anyhow::{anyhow, bail, Result};
use std::{
    borrow::Cow,
    collections::{BTreeMap, BTreeSet, HashMap, HashSet},
    env, fs,
    io::Write,
    path::{Path, PathBuf},
    time::Instant,
};

#[derive(Debug, Clone)]
struct Package {
    name: String,
    prefix: PathBuf,
    deps: BTreeSet<String>,
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
                packages.insert(
                    name.clone(),
                    Package {
                        name,
                        prefix: search_path.to_path_buf(),
                        deps,
                    },
                );
            }
        }
        packages
    }

    fn package_dsv(&self) -> PathBuf {
        self.prefix
            .join("share")
            .join(&self.name)
            .join("package.dsv")
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
enum DsvOperation {
    PrependNonDuplicate {
        name: String,
        value: PathBuf,
        if_exists: bool,
    },
    Set {
        name: String,
        value: PathBuf,
        if_unset: bool,
    },
    Source {
        path: PathBuf,
        prefix: PathBuf,
    },
}

fn parse_dsv(content: &str, prefix: &Path) -> Result<Vec<DsvOperation>> {
    let mut ops = vec![];
    let add_prefix_if_relative = |path: &str| -> PathBuf {
        let path = Path::new(path);
        if path.is_relative() {
            prefix.join(path)
        } else {
            path.to_path_buf()
        }
    };
    for line in content.lines() {
        let mut split = line.split(';');
        let op = split.next();
        let first = split.next();
        let second = split.next();
        match op {
            Some("prepend-non-duplicate") => {
                let name = first.ok_or_else(|| anyhow!("missing name"))?;
                let value = second.ok_or_else(|| anyhow!("missing value"))?;
                ops.push(DsvOperation::PrependNonDuplicate {
                    name: name.to_string(),
                    value: add_prefix_if_relative(value),
                    if_exists: false,
                });
            }
            Some("prepend-non-duplicate-if-exists") => {
                let name = first.ok_or_else(|| anyhow!("missing name"))?;
                let value = second.ok_or_else(|| anyhow!("missing value"))?;
                ops.push(DsvOperation::PrependNonDuplicate {
                    name: name.to_string(),
                    value: add_prefix_if_relative(value),
                    if_exists: true,
                });
            }
            Some("set") => {
                let name = first.ok_or_else(|| anyhow!("missing name"))?;
                let value = second.ok_or_else(|| anyhow!("missing value"))?;
                ops.push(DsvOperation::Set {
                    name: name.to_string(),
                    value: add_prefix_if_relative(value),
                    if_unset: false,
                });
            }
            Some("set-if-unset") => {
                let name = first.ok_or_else(|| anyhow!("missing name"))?;
                let value = second.ok_or_else(|| anyhow!("missing value"))?;
                ops.push(DsvOperation::Set {
                    name: name.to_string(),
                    value: add_prefix_if_relative(value),
                    if_unset: true,
                });
            }
            Some("source") => {
                let path = first.ok_or_else(|| anyhow!("missing path"))?;
                ops.push(DsvOperation::Source {
                    path: prefix.join(path),
                    prefix: prefix.to_path_buf(),
                });
            }
            Some(_) => {
                bail!("unknown dsv operation: {op:?}");
            }
            None => {}
        }
    }
    Ok(ops)
}

fn dsv_optimize_source(ops: Vec<DsvOperation>) -> Result<Vec<DsvOperation>> {
    #[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash, Default)]
    struct AvailableExtensions {
        dsv: bool,
        sh: bool,
        bash: bool,
    }

    let mut new_ops = Vec::new();
    let mut added = HashSet::new();
    for op in ops.iter() {
        if let DsvOperation::Source { path, prefix } = op {
            let base = path.with_extension("");
            if added.contains(&base) {
                continue;
            }
            let prefix = prefix.to_path_buf();
            if base.with_extension("dsv").is_file() {
                let path = base.with_extension("dsv");
                let content = fs::read_to_string(path)?;
                new_ops.extend(dsv_optimize_source(parse_dsv(&content, &prefix)?)?);
            } else if base.with_extension("sh").is_file() {
                new_ops.push(DsvOperation::Source {
                    path: base.with_extension("sh"),
                    prefix,
                });
            } else if base.with_extension("bash").is_file() {
                new_ops.push(DsvOperation::Source {
                    path: base.with_extension("bash"),
                    prefix,
                });
            }
            added.insert(base);
        } else {
            new_ops.push(op.clone());
        }
    }
    Ok(new_ops)
}

fn toposort_pkgs(pkgs: &BTreeMap<String, Package>) -> Vec<&str> {
    let mut visited = HashSet::new();
    let mut sorted = Vec::new();
    fn visit<'a>(
        name: &str,
        pkgs: &'a BTreeMap<String, Package>,
        visited: &mut HashSet<String>,
        sorted: &mut Vec<&'a str>,
    ) {
        if visited.contains(name) {
            return;
        }
        visited.insert(name.to_string());
        if let Some(pkg) = pkgs.get(name) {
            for dep in pkg.deps.iter() {
                visit(dep, pkgs, visited, sorted);
            }
            sorted.push(&pkg.name);
        }
    }
    for name in pkgs.keys() {
        visit(name, pkgs, &mut visited, &mut sorted);
    }
    sorted
}

fn gether_dsv_ops(
    pkgs: &BTreeMap<String, Package>,
    sorted_pkgs: &[&str],
) -> Result<Vec<DsvOperation>> {
    let mut ops = Vec::new();

    for name in sorted_pkgs.iter() {
        if let Some(pkg) = pkgs.get(*name) {
            let dsv_path = pkg.package_dsv();
            let content = fs::read_to_string(&dsv_path)?;
            let mut pkg_ops = parse_dsv(&content, &pkg.prefix).unwrap();
            pkg_ops = dsv_optimize_source(pkg_ops).unwrap();
            ops.extend(pkg_ops);
        }
    }

    Ok(ops)
}

fn escape(s: &str) -> Cow<str> {
    shell_escape::escape(Cow::Borrowed(s))
}

fn generate_setup_script(
    mut dst: impl Write,
    ops: &[DsvOperation],
    mut env: HashMap<String, String>,
) -> Result<()> {
    let mut sources = Vec::new();
    let mut modified_env = BTreeSet::new();
    for op in ops.iter() {
        match op {
            DsvOperation::PrependNonDuplicate {
                name,
                value,
                if_exists,
            } => {
                if let Some(prev) = env.get_mut(name) {
                    if prev.len() != 0 {
                        *prev = format!("{}:{prev}", value.display());
                        modified_env.insert(name);
                    } else if !if_exists {
                        *prev = value.display().to_string();
                        modified_env.insert(name);
                    }
                } else if !if_exists {
                    env.insert(name.clone(), value.display().to_string());
                    modified_env.insert(name);
                }
            }
            DsvOperation::Set {
                name,
                value,
                if_unset,
            } => {
                if let Some(prev) = env.get_mut(name) {
                    if prev.len() == 0 || !if_unset {
                        *prev = value.display().to_string();
                        modified_env.insert(name);
                    }
                } else {
                    env.insert(name.clone(), value.display().to_string());
                    modified_env.insert(name);
                }
            }
            DsvOperation::Source { path, prefix } => {
                sources.push((path, prefix));
            }
        }
    }

    for modified in modified_env.into_iter() {
        writeln!(dst, "export {modified}={}", escape(&env[modified]))?;
    }

    for (path, prefix) in sources.into_iter() {
        writeln!(
            dst,
            "export COLCON_CURRENT_PREFIX={}",
            escape(prefix.to_str().unwrap())
        )?;
        writeln!(dst, "source {}", escape(path.to_str().unwrap()))?;
    }

    Ok(())
}

fn main() -> Result<()> {
    eprintln!("ros2nix-setup-helper: generating setup script");
    let start = Instant::now();
    let search_path: Vec<_> = env::var("_ROS2NIX_SEARCH_PATH")
        .unwrap_or_default()
        .split(":")
        .map(PathBuf::from)
        .collect();
    let pkgs: BTreeMap<String, Package> = search_path
        .iter()
        .flat_map(|p| Package::find(p).into_iter())
        .collect();
    let sorted_pkgs = toposort_pkgs(&pkgs);
    let ops = gether_dsv_ops(&pkgs, &sorted_pkgs)?;
    let env: HashMap<String, String> = env::vars().collect();
    generate_setup_script(std::io::stdout(), &ops, env)?;
    eprintln!(
        "ros2nix-setup-helper: done. elapsed: {}us",
        start.elapsed().as_micros()
    );
    Ok(())
}