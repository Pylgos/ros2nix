use std::{
    collections::{BTreeMap, BTreeSet, HashMap, HashSet},
    fs::File,
    io::{Read, Write},
};

use anyhow::{Context, Result};
use reqwest::{IntoUrl, Url};
use serde_roxmltree::Options;
use tracing::{debug, info};
use yaml_rust2::YamlLoader;

use crate::{condition::eval_condition, config::ConfigRef};

#[derive(Debug, Clone)]
pub struct DistroIndex {
    pub distros: BTreeMap<String, PackageIndex>,
}

#[derive(Debug, Clone)]
pub struct PackageIndex {
    pub name: String,
    pub status: DistroStatus,
    pub cache_url: Url,
    pub ros_version: RosVersion,
    pub python_version: PythonVersion,
    pub manifests: BTreeMap<String, PackageManifest>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DistroStatus {
    Active,
    EndOfLife,
    Rolling,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum RosVersion {
    Ros1,
    Ros2,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PythonVersion {
    Python2,
    Python3,
}

#[derive(Debug, Clone)]
pub struct PackageManifest {
    pub name: String,
    pub release_version: String,
    pub description: String,
    pub repository: String,
    pub tag: String,
    pub dependencies: RosDependencies,
    pub member_of_group: BTreeSet<String>,
}

#[derive(Debug, Clone)]
pub struct RosDependencies {
    pub build: BTreeSet<String>,
    pub build_export: BTreeSet<String>,
    pub buildtool: BTreeSet<String>,
    pub buildtool_export: BTreeSet<String>,
    pub exec: BTreeSet<String>,
    pub test: BTreeSet<String>,
    pub group_depend: BTreeSet<String>,
}

impl RosDependencies {
    pub fn all_buildtool_deps(&self) -> BTreeSet<String> {
        &self.buildtool | &self.buildtool_export
    }

    pub fn all_runtime_deps(&self) -> BTreeSet<String> {
        &(&self.build | &self.build_export) | &self.exec
    }
}

async fn fetch_file_cached(cfg: &ConfigRef, url: impl IntoUrl) -> Result<Vec<u8>> {
    let url = url.into_url().unwrap();
    let cache_path = cfg
        .cache_dir()
        .join(url.path_segments().unwrap().last().unwrap());
    if cache_path.exists() {
        debug!("cache hit {url}");
        let mut file = File::open(cache_path)?;
        let mut buf = Vec::new();
        file.read_to_end(&mut buf)?;
        return Ok(buf);
    }

    debug!("downloading {url}");
    let response = reqwest::get(url.clone()).await?.error_for_status()?;
    let bytes = response.bytes().await?;
    let mut file = File::create(cache_path)?;
    file.write_all(&bytes)?;
    Ok(bytes.to_vec())
}

impl DistroIndex {
    pub async fn fetch(cfg: &ConfigRef) -> Result<Self> {
        let url = "https://raw.githubusercontent.com/ros/rosdistro/master/index-v4.yaml";
        let content = String::from_utf8(fetch_file_cached(cfg, url).await?)?;

        let docs = YamlLoader::load_from_str(&content)?;
        let doc = &docs[0];

        let mut distros = BTreeMap::new();

        for (distro_name, distro) in doc["distributions"].as_hash().unwrap() {
            let name = distro_name.as_str().unwrap().to_string();
            let status = match distro["distribution_status"].as_str().unwrap() {
                "active" => DistroStatus::Active,
                "end-of-life" => DistroStatus::EndOfLife,
                "rolling" => DistroStatus::Rolling,
                _ => unimplemented!(),
            };
            let cache = Url::parse(distro["distribution_cache"].as_str().unwrap()).unwrap();
            let ros_version = match distro["distribution_type"].as_str().unwrap() {
                "ros1" => RosVersion::Ros1,
                "ros2" => RosVersion::Ros2,
                _ => unimplemented!(),
            };
            let python_version = match distro["python_version"].as_i64().unwrap() {
                2 => PythonVersion::Python2,
                3 => PythonVersion::Python3,
                _ => unimplemented!(),
            };

            if ros_version != RosVersion::Ros2 {
                continue;
            }

            if status == DistroStatus::EndOfLife {
                continue;
            }

            let mut env = cfg.env().get(&name).cloned().unwrap_or_default();
            match ros_version {
                RosVersion::Ros1 => {
                    env.insert("ROS_VERSION".to_string(), "1".to_string());
                    env.insert("ros_version".to_string(), "1".to_string());
                }
                RosVersion::Ros2 => {
                    env.insert("ROS_VERSION".to_string(), "2".to_string());
                    env.insert("ros_version".to_string(), "2".to_string());
                }
            }
            match python_version {
                PythonVersion::Python2 => {
                    env.insert("ROS_PYTHON_VERSION".to_string(), "2".to_string());
                }
                PythonVersion::Python3 => {
                    env.insert("ROS_PYTHON_VERSION".to_string(), "3".to_string());
                }
            }
            env.insert("ROS_DISTRO".to_string(), name.clone());
            let manifests = fetch_package_manifests(cfg, &cache, &name, &env).await?;

            distros.insert(
                name.clone(),
                PackageIndex {
                    name,
                    status,
                    cache_url: cache,
                    ros_version,
                    python_version,
                    manifests,
                },
            );
        }

        Ok(DistroIndex { distros })
    }
}

async fn fetch_package_manifests(
    cfg: &ConfigRef,
    url: &Url,
    distro_name: &str,
    env: &HashMap<String, String>,
) -> Result<BTreeMap<String, PackageManifest>> {
    info!("fetching package manifest from {url}");
    let content = fetch_file_cached(cfg, url.clone()).await?;
    let mut decoder = flate2::read::GzDecoder::new(&content[..]);
    let mut buf = String::new();
    decoder.read_to_string(&mut buf)?;
    Ok(parse_distro_packages(cfg, &buf, distro_name, env)?)
}

fn parse_distro_packages(
    cfg: &ConfigRef,
    data: &str,
    distro_name: &str,
    env: &HashMap<String, String>,
) -> Result<BTreeMap<String, PackageManifest>> {
    let docs = YamlLoader::load_from_str(&data)?;
    let doc = &docs[0];
    let distro = &doc["distribution_file"][0];
    let mut packages = BTreeMap::new();
    for (repo_name, repo) in distro["repositories"].as_hash().unwrap() {
        let repo_name = repo_name.as_str().unwrap();
        let release = &repo["release"];
        let tag_template = &release["tags"]["release"];
        let url = &release["url"];
        let version = &release["version"];
        if release.is_badvalue()
            || tag_template.is_badvalue()
            || url.is_badvalue()
            || version.is_badvalue()
        {
            continue;
        }
        let tag_template = tag_template.as_str().unwrap();
        let url = url.as_str().unwrap();
        let version = version.as_str().unwrap();
        let repo_packages = if release["packages"].is_badvalue() {
            vec![repo_name]
        } else {
            release["packages"]
                .as_vec()
                .unwrap()
                .iter()
                .map(|s| s.as_str().unwrap())
                .collect()
        };
        for package_name in repo_packages.into_iter() {
            let span = tracing::span!(
                tracing::Level::INFO,
                "parse package",
                package = package_name
            );
            let _enter = span.enter();
            let tag = tag_template
                .replace("{version}", version)
                .replace("{package}", package_name);
            let package_xml_str = doc["release_package_xmls"][package_name].as_str().unwrap();
            let (member_of_group, dependencies) = parse_package_xml(cfg, package_xml_str, env)
                .context(format!("failed to parse package.xml of {package_name}"))?;
            let manifest = PackageManifest {
                name: package_name.to_string(),
                release_version: version.to_string(),
                description: "".to_string(),
                repository: url.to_string(),
                tag,
                dependencies,
                member_of_group,
            };
            packages.insert(package_name.to_string(), manifest);
        }
    }
    Ok(packages)
}

fn parse_package_xml(
    cfg: &ConfigRef,
    xml_str: &str,
    env: &HashMap<String, String>,
) -> Result<(BTreeSet<String>, RosDependencies)> {
    #[derive(Debug, serde::Deserialize)]
    struct Doc {
        version: String,
        #[serde(default)]
        build_depend: Vec<Dep>,
        #[serde(default)]
        build_export_depend: Vec<Dep>,
        #[serde(default)]
        buildtool_depend: Vec<Dep>,
        #[serde(default)]
        buildtool_export_depend: Vec<Dep>,
        #[serde(default)]
        exec_depend: Vec<Dep>,
        #[serde(default)]
        test_depend: Vec<Dep>,
        #[serde(default)]
        depend: Vec<Dep>,
        #[serde(default)]
        group_depend: Vec<Dep>,
        #[serde(default)]
        member_of_group: Vec<String>,
    }

    #[derive(Debug, serde::Deserialize)]
    struct Dep {
        #[serde(rename = "@condition")]
        condition: Option<String>,
        #[serde(rename = "$text")]
        name: String,
    }

    let resolve = |deps: &Vec<Dep>| -> Result<BTreeSet<String>> {
        let mut result = BTreeSet::new();
        for dep in deps.iter() {
            if let Some(cond) = &dep.condition {
                if eval_condition(cond, env)? {
                    result.insert(dep.name.clone());
                }
            } else {
                result.insert(dep.name.clone());
            }
        }
        Ok(result)
    };

    let xml_doc = roxmltree::Document::parse(xml_str)?;
    let doc: Doc = serde_roxmltree::defaults()
        .prefix_attr()
        .from_doc(&xml_doc)?;
    let depend = resolve(&doc.depend)?;
    let deps = RosDependencies {
        build: resolve(&doc.build_depend)?
            .union(&depend)
            .cloned()
            .collect(),
        build_export: resolve(&doc.build_export_depend)?
            .union(&depend)
            .cloned()
            .collect(),
        buildtool: resolve(&doc.buildtool_depend)?,
        buildtool_export: resolve(&doc.buildtool_export_depend)?,
        exec: resolve(&doc.exec_depend)?.union(&depend).cloned().collect(),
        test: resolve(&doc.test_depend)?,
        group_depend: resolve(&doc.group_depend)?,
    };

    Ok((doc.member_of_group.into_iter().collect(), deps))
}

#[cfg(test)]
mod test {
    use super::*;
    use crate::config::Config;

    #[tokio::test]
    async fn test_fetch_distro_index() {
        tracing_subscriber::fmt::init();
        let cfg = Config::new().into_ref();
        cfg.create_directories().unwrap();
        let _index = DistroIndex::fetch(&cfg).await.unwrap();
    }
}
