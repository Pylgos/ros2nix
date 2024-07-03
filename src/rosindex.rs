use std::{
    collections::{BTreeMap, BTreeSet, HashMap, HashSet},
    fs::File,
    io::{Read, Write},
};

use anyhow::{Context as _, Result};
use reqwest::{IntoUrl, Url};
use yaml_rust2::YamlLoader;

use crate::{condition::eval_condition, config::ConfigRef};

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
pub struct RosDistroIndexElement {
    pub name: String,
    pub status: DistroStatus,
    pub cache: Url,
    pub ros_version: RosVersion,
    pub python_version: PythonVersion,
}

#[derive(Debug, Clone)]
pub struct RosDistroIndex {
    pub distros: HashMap<String, RosDistroIndexElement>,
}

async fn fetch_file_cached(cfg: ConfigRef, url: impl IntoUrl) -> Result<Vec<u8>> {
    let url = url.into_url().unwrap();
    let cache_path = cfg
        .cache_dir
        .join(url.path_segments().unwrap().last().unwrap());
    if cache_path.exists() {
        let mut file = File::open(cache_path)?;
        let mut buf = Vec::new();
        file.read_to_end(&mut buf)?;
        return Ok(buf);
    }

    let response = reqwest::get(url.clone()).await?.error_for_status()?;
    let bytes = response.bytes().await?;
    let mut file = File::create(cache_path)?;
    file.write_all(&bytes)?;
    Ok(bytes.to_vec())
}

async fn fetch_distro_index(cfg: ConfigRef) -> Result<RosDistroIndex> {
    let url = "https://raw.githubusercontent.com/ros/rosdistro/master/index-v4.yaml";
    let content = String::from_utf8(fetch_file_cached(cfg, url).await?)?;

    let docs = YamlLoader::load_from_str(&content)?;
    let doc = &docs[0];

    let distros = doc["distributions"]
        .as_hash()
        .unwrap()
        .iter()
        .map(|(distro_name, inner)| {
            let name = distro_name.as_str().unwrap().to_string();
            let status = match inner["distribution_status"].as_str().unwrap() {
                "active" => DistroStatus::Active,
                "end-of-life" => DistroStatus::EndOfLife,
                "rolling" => DistroStatus::Rolling,
                _ => unimplemented!(),
            };
            let cache = Url::parse(inner["distribution_cache"].as_str().unwrap()).unwrap();
            let ros_version = match inner["distribution_type"].as_str().unwrap() {
                "ros1" => RosVersion::Ros1,
                "ros2" => RosVersion::Ros2,
                _ => unimplemented!(),
            };
            let python_version = match inner["python_version"].as_i64().unwrap() {
                2 => PythonVersion::Python2,
                3 => PythonVersion::Python3,
                _ => unimplemented!(),
            };

            (
                name.clone(),
                RosDistroIndexElement {
                    name,
                    status,
                    cache,
                    ros_version,
                    python_version,
                },
            )
        })
        .collect::<HashMap<_, _>>();

    Ok(RosDistroIndex { distros })
}

#[derive(Debug, Clone)]
pub struct DistroPackages {
    packages: BTreeMap<String, PackageManifest>,
}

#[derive(Debug, Clone)]
pub struct PackageManifest {
    name: String,
    release_version: String,
    description: String,
    repository: String,
    tag: String,
    dependencies: Dependencies,
}

#[derive(Debug, Clone)]
pub struct Dependencies {
    build: BTreeSet<String>,
    build_export: BTreeSet<String>,
    buildtool: BTreeSet<String>,
    buildtool_export: BTreeSet<String>,
    exec: BTreeSet<String>,
    test: BTreeSet<String>,
}

impl DistroPackages {
    pub async fn fetch(cfg: Config)
}

async fn fetch_distro_packages(cfg: ConfigRef, url: &Url) -> Result<DistroPackages> {
    let content = fetch_file_cached(cfg.clone(), url.clone()).await?;
    let mut decoder = flate2::read::GzDecoder::new(&content[..]);
    let mut buf = String::new();
    decoder.read_to_string(&mut buf)?;
    parse_distro_packages(cfg.clone(), &buf)
}

fn parse_distro_packages(cfg: ConfigRef, data: &str) -> Result<DistroPackages> {
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
            let tag = tag_template
                .replace("{version}", version)
                .replace("{package}", package_name);
            let package_xml_str = doc["release_package_xmls"][package_name].as_str().unwrap();
            let dependencies = parse_package_xml(cfg.clone(), package_xml_str)?;
            let manifest = PackageManifest {
                name: package_name.to_string(),
                release_version: version.to_string(),
                description: "".to_string(),
                repository: url.to_string(),
                tag,
                dependencies,
            };
            packages.insert(package_name.to_string(), manifest);
        }
    }
    Ok(DistroPackages { packages })
}

fn parse_package_xml(cfg: ConfigRef, xml_str: &str) -> Result<Dependencies> {
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
                if eval_condition(cond, &cfg.env)? {
                    result.insert(dep.name.clone());
                }
            } else {
                result.insert(dep.name.clone());
            }
        }
        Ok(result)
    };

    let xml_doc = roxmltree::Document::parse(xml_str)?;
    let doc: Doc = serde_roxmltree::from_doc(&xml_doc)?;
    let deps = Dependencies {
        build: resolve(&doc.build_depend)?,
        build_export: resolve(&doc.build_export_depend)?,
        buildtool: resolve(&doc.buildtool_depend)?,
        buildtool_export: resolve(&doc.buildtool_export_depend)?,
        exec: resolve(&doc.exec_depend)?,
        test: resolve(&doc.test_depend)?,
    };

    Ok(deps)
}

#[cfg(test)]
mod test {
    use super::*;
    use crate::config::Config;

    #[tokio::test]
    async fn test_fetch_distro_index() {
        let cfg = Config::new().into_ref();
        cfg.create_directories().unwrap();
        let index = fetch_distro_index(cfg).await.unwrap();
        println!("{:?}", index);
    }

    #[tokio::test]
    async fn test_fetch_distro_cache() {
        let cfg = Config::new().into_ref();
        cfg.create_directories().unwrap();
        let index = fetch_distro_index(cfg.clone()).await.unwrap();
        let distro = index.distros.get("jazzy").unwrap();
        let cache = fetch_distro_packages(cfg.clone(), &distro.cache)
            .await
            .unwrap();
        println!("{:?}", cache);
    }
}
