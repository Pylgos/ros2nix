use std::{
    collections::{BTreeSet, HashMap, HashSet},
    fs,
    ops::Range,
    path::{Path, PathBuf},
    sync::Arc,
};

use anyhow::{Context, Result};
use futures::{future::BoxFuture, FutureExt};
use reqwest::Url;
use tracing::{debug, warn};
use walkdir::WalkDir;

use crate::source::{Fetcher, Source};

#[derive(Debug, Clone, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub struct PatchedSource {
    pub source: Source,
    pub substitutions: BTreeSet<Substitution>,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub struct Substitution {
    pub path: PathBuf,
    pub from: String,
    pub with: Replacement,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub enum Replacement {
    Path(PatchedSource),
    Url(PatchedSource),
    Download(PatchedSource),
    Literal(String),
}

impl PatchedSource {
    pub fn name(&self) -> &str {
        self.source.name()
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
struct CMakeCall {
    func: String,
    args: Vec<CMakeToken>,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
struct CMakeToken {
    range: Range<usize>,
    kind: CMakeTokenKind,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
enum CMakeTokenKind {
    Ident(String),
    Literal(String),
    ParLe,
    ParRi,
}

fn cmake_tokenize(src: &str) -> Vec<CMakeToken> {
    let mut tokens = Vec::new();
    let mut chars = src.char_indices();
    loop {
        let Some((i, c)) = chars.next() else {
            break;
        };
        match c {
            ' ' | '\t' | '\n' => {}
            '(' => {
                tokens.push(CMakeToken {
                    range: i..i + 1,
                    kind: CMakeTokenKind::ParLe,
                });
            }
            ')' => {
                tokens.push(CMakeToken {
                    range: i..i + 1,
                    kind: CMakeTokenKind::ParRi,
                });
            }
            '"' => {
                let start = i;
                let mut s = String::new();
                while let Some((i, c)) = chars.next() {
                    match c {
                        '"' => {
                            tokens.push(CMakeToken {
                                range: start..i + 1,
                                kind: CMakeTokenKind::Literal(s),
                            });
                            break;
                        }
                        '\\' => {
                            if let Some((_, c)) = chars.next() {
                                match c {
                                    'n' => s.push('\n'),
                                    'r' => s.push('\r'),
                                    't' => s.push('\t'),
                                    '\\' => s.push('\\'),
                                    '"' => s.push('"'),
                                    _ => {}
                                }
                            }
                        }
                        _ => {
                            s.push(c);
                        }
                    }
                }
            }
            '#' => {
                for (_, c) in chars.by_ref() {
                    if c == '\n' {
                        break;
                    }
                }
            }
            _ => {
                let start = i;
                while let Some((i, c)) = chars.clone().next() {
                    match c {
                        ' ' | '\t' | '\n' | '(' | ')' | '"' | '#' => {
                            tokens.push(CMakeToken {
                                range: start..i,
                                kind: CMakeTokenKind::Ident(src[start..i].to_string()),
                            });
                            break;
                        }
                        _ => {
                            chars.next();
                        }
                    }
                }
            }
        }
    }
    tokens
}

fn cmake_find_calls(src: &str) -> Vec<CMakeCall> {
    let mut calls = Vec::new();
    let tokens = cmake_tokenize(src);
    let mut tokens_iter = tokens.iter().peekable();

    loop {
        use CMakeTokenKind::*;

        let Some(token) = tokens_iter.next() else {
            break;
        };

        if let Ident(func) = &token.kind {
            let Some(next) = tokens_iter.peek().copied() else {
                break;
            };
            if next.kind != ParLe {
                continue;
            }
            tokens_iter.next(); // skip '('
            let mut args = Vec::new();
            for token in tokens_iter.by_ref() {
                match &token.kind {
                    ParRi => {
                        break;
                    }
                    _ => {
                        args.push(token.clone());
                    }
                }
            }
            calls.push(CMakeCall {
                func: func.clone(),
                args,
            });
        }
    }

    calls
}

fn cmake_resolve_var(vars: &HashMap<String, String>, arg: &CMakeToken) -> Option<String> {
    use CMakeTokenKind::*;
    let arg = match &arg.kind {
        Ident(s) => s,
        Literal(s) => s,
        _ => return None,
    };

    let mut chars = arg.chars().peekable();
    let mut result = String::new();

    loop {
        let Some(cur) = chars.next() else {
            break;
        };
        let maybe_next = chars.peek();

        match (cur, maybe_next) {
            ('$', Some('{')) => {
                chars.next(); // skip '{'
                let mut var = String::new();
                for c in chars.by_ref() {
                    if c == '}' {
                        if let Some(v) = vars.get(&var) {
                            result.push_str(v);
                        }
                        break;
                    }
                    var.push(c);
                }
            }
            _ => {
                result.push(cur);
            }
        }
    }

    Some(result)
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
struct CMakeArgs {
    args: Vec<String>,
    ranges: Vec<Range<usize>>,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
struct CMakeKeywordArg {
    value: String,
    range: Range<usize>,
}

impl CMakeArgs {
    fn parse(tokens: &[CMakeToken], vars: &HashMap<String, String>) -> Self {
        let mut result = CMakeArgs {
            args: Vec::new(),
            ranges: Vec::new(),
        };
        for token in tokens {
            if let Some(arg) = cmake_resolve_var(vars, token) {
                result.args.push(arg);
                result.ranges.push(token.range.clone());
            }
        }
        result
    }

    fn find_keyword_arg(&self, keyword: &str) -> Option<CMakeKeywordArg> {
        let mut args = self.args.iter().zip(self.ranges.iter());
        while let Some((arg, range)) = args.next() {
            if arg == keyword {
                if let Some((next_arg, next_range)) = args.clone().next() {
                    return Some(CMakeKeywordArg {
                        value: next_arg.clone(),
                        range: range.start..next_range.end,
                    });
                }
            }
        }
        None
    }

    fn find_keyword_arg_expect_url(&self, keyword: &str) -> Option<CMakeKeywordArg> {
        let arg = self.find_keyword_arg(keyword);
        if let Some(arg) = arg {
            match Url::parse(&arg.value) {
                Ok(_) => Some(arg),
                Err(err) => {
                    warn!("failed to parse url: {}", err);
                    None
                }
            }
        } else {
            None
        }
    }

    fn get(&self, index: usize) -> Option<&str> {
        self.args.get(index).map(|s| s.as_str())
    }
}

fn guess_name_from_url(url: &str) -> Option<String> {
    let url = Url::parse(url).ok()?;
    let path = url.path_segments()?.last()?;
    let name = path.split('.').next()?;
    Some(name.to_string())
}

fn get_vendor_source_name(name: &str, url: &str, disamb: usize) -> String {
    format!(
        "{name}-vendor_source-{}-{disamb}",
        guess_name_from_url(url).unwrap_or("unknown".into())
    )
}

fn autopatch_source_recurse(
    fetcher: &Arc<Fetcher>,
    src: &Source,
    fetched: HashSet<Source>,
) -> BoxFuture<'static, Result<PatchedSource>> {
    let fetcher = fetcher.clone();
    let src = src.clone();
    let fetched = fetched.clone();
    async move { autopatch_source_impl(&fetcher, &src, &fetched).await }.boxed()
}

async fn autopatch_cmake_vendor(
    fetcher: &Arc<Fetcher>,
    name: &str,
    path: &Path,
    rel_path: &Path,
    fetched: &HashSet<Source>,
) -> Result<BTreeSet<Substitution>> {
    let mut result = BTreeSet::new();
    debug!("checking {path:?}");
    let content_bytes = fs::read(path).context(format!("failed to read cmake file: {path:?}"))?;
    let content = String::from_utf8_lossy(&content_bytes);
    let calls = cmake_find_calls(&content);

    let mut vars = HashMap::new();
    for call in calls {
        let args = CMakeArgs::parse(&call.args, &vars);
        match call.func.to_ascii_lowercase().as_str() {
            "set" => {
                let (Some(key), Some(value)) = (args.get(0), args.get(1)) else {
                    continue;
                };
                vars.insert(key.into(), value.into());
            }
            "externalproject_add" | "fetchcontent_declare" => {
                let git_repo = args.find_keyword_arg_expect_url("GIT_REPOSITORY");
                let git_tag = args.find_keyword_arg("GIT_TAG");
                let url = args.find_keyword_arg_expect_url("URL");
                if let (Some(repo), Some(tag)) = (git_repo, git_tag) {
                    let name = get_vendor_source_name(name, &repo.value, result.len());
                    let from = content[repo.range].to_string();
                    let source = fetcher.fetch_git(&name, &repo.value, &tag.value).await?;
                    let mut fetched = fetched.clone();
                    if fetched.contains(&source) {
                        continue;
                    } else {
                        fetched.insert(source.clone());
                    }
                    let patched = autopatch_source_recurse(fetcher, &source, fetched).await?;
                    result.insert(Substitution {
                        path: rel_path.to_path_buf(),
                        from,
                        with: Replacement::Url(patched),
                    });
                } else if let Some(url) = url {
                    let name = get_vendor_source_name(name, &url.value, result.len());
                    let from = content[url.range].to_string();
                    let source = fetcher
                        .fetch_url(&name, &url.value, true)
                        .await
                        .context(format!("failed to fetch archive {name} {}", url.value))?;
                    let mut fetched = fetched.clone();
                    if fetched.contains(&source) {
                        continue;
                    } else {
                        fetched.insert(source.clone());
                    }
                    let patched = autopatch_source_recurse(fetcher, &source, fetched).await?;
                    result.insert(Substitution {
                        path: rel_path.to_path_buf(),
                        from,
                        with: Replacement::Url(patched),
                    });
                }
            }
            "ament_vendor" => {
                let vcs_type = args.find_keyword_arg("VCS_TYPE");
                let vcs_url = args.find_keyword_arg_expect_url("VCS_URL");
                let vcs_version = args.find_keyword_arg("VCS_VERSION");

                if let (Some(vcs_url), Some(vcs_version)) = (vcs_url, vcs_version) {
                    let name = get_vendor_source_name(name, &vcs_url.value, result.len());
                    let from = content[vcs_url.range.clone()].to_string();
                    let source = match vcs_type.as_ref().map(|arg| arg.value.as_str()) {
                        Some("git") | None => {
                            fetcher
                                .fetch_git(&name, &vcs_url.value, &vcs_version.value)
                                .await?
                        }
                        Some("zip") => fetcher
                            .fetch_url(&name, &vcs_url.value, true)
                            .await
                            .context(format!("failed to fetch archive {name} {}", vcs_url.value))?,
                        Some(ty) => {
                            return Err(anyhow::anyhow!("unsupported VCS_TYPE {ty}"));
                        }
                    };
                    let mut fetched = fetched.clone();
                    if fetched.contains(&source) {
                        continue;
                    } else {
                        fetched.insert(source.clone());
                    }
                    let patched = autopatch_source_recurse(fetcher, &source, fetched).await?;
                    result.insert(Substitution {
                        path: rel_path.to_path_buf(),
                        from,
                        with: Replacement::Path(patched),
                    });
                    // Remove VCS_TYPE if exists
                    if let Some(vcs_type) = &vcs_type {
                        let from = content[vcs_type.range.clone()].to_string();
                        result.insert(Substitution {
                            path: rel_path.to_path_buf(),
                            from,
                            with: Replacement::Literal("".into()),
                        });
                    }
                }
            }
            "file" => {
                let url = args.find_keyword_arg_expect_url("DOWNLOAD");
                if let Some(url) = url {
                    let name = get_vendor_source_name(name, &url.value, result.len());
                    let from = content[url.range].to_string();
                    let source = fetcher
                        .fetch_url(&name, &url.value, false)
                        .await
                        .context(format!("failed to fetch archive {name} {}", url.value))?;
                    result.insert(Substitution {
                        path: rel_path.to_path_buf(),
                        from,
                        with: Replacement::Download(PatchedSource {
                            source,
                            substitutions: BTreeSet::new(),
                        }),
                    });
                }
            }
            _ => {}
        }
    }

    Ok(result)
}

#[tracing::instrument(skip(fetcher), fields(src = %src.name()))]
pub async fn autopatch_source(fetcher: &Arc<Fetcher>, src: &Source) -> Result<PatchedSource> {
    let mut fetched = HashSet::new();
    fetched.insert(src.clone());
    autopatch_source_impl(fetcher, src, &fetched).await
}

async fn autopatch_source_impl(
    fetcher: &Arc<Fetcher>,
    src: &Source,
    fetched: &HashSet<Source>,
) -> Result<PatchedSource> {
    let mut substitutions = BTreeSet::new();

    for file in WalkDir::new(src.path()) {
        let file = file?;
        if file.file_type().is_dir() {
            continue;
        }
        let rel_path = file.path().strip_prefix(src.path())?;
        let rel_path_str = rel_path.to_string_lossy().to_ascii_lowercase();
        if rel_path_str.contains("test") || rel_path_str.contains("example") {
            continue;
        }
        let filename = file.file_name().to_string_lossy();
        if filename == "ci-build.cmake" {
            continue;
        }
        if filename == "CMakeLists.txt"
            || filename.ends_with(".cmake")
            || filename.ends_with(".cmake.in")
        {
            let subst =
                autopatch_cmake_vendor(fetcher, src.name(), file.path(), rel_path, fetched).await;
            match subst {
                Ok(subst) => substitutions.extend(subst),
                Err(err) => {
                    warn!("failed to autopatch {file:?}: {err}");
                }
            }
        }
    }

    Ok(PatchedSource {
        source: src.clone(),
        substitutions,
    })
}

#[cfg(test)]
mod test {
    use std::path::PathBuf;

    use tracing::level_filters::LevelFilter;

    use crate::config::Config;

    use super::*;

    fn resource_dir() -> PathBuf {
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("resources")
            .join("test")
    }

    #[tokio::test]
    async fn test_autopatch_foonathan_memory_vendor() {
        let _ = tracing_subscriber::fmt()
            .with_max_level(LevelFilter::DEBUG)
            .try_init();
        let config = Config::default().into_ref();
        let fetcher = Arc::new(Fetcher::new(&config, "test"));
        let base_path = resource_dir().join("foonathan_memory_vendor");
        let rel_path = PathBuf::from("CMakeLists.txt");
        let mut fetched = HashSet::new();
        let subs = autopatch_cmake_vendor(
            &fetcher,
            "foonathan_memory_vendor",
            &base_path.join(&rel_path),
            &rel_path,
            &mut fetched,
        )
        .await
        .unwrap();
        for sub in subs.iter() {
            println!("{:?}", sub);
        }
        subs.iter().next().unwrap();
    }

    #[test]
    fn test_cmake_tokenize() {
        let src = r#"cmake_minimum_required(VERSION 3.6)
project(pybind11-json-download NONE)

include(ExternalProject)
ExternalProject_Add(
    pybind11_json
    PREFIX .
    GIT_REPOSITORY "https://github.com/pybind/pybind11_json.git"
    GIT_TAG        0.2.13
    GIT_CONFIG     advice.detachedHead=false  # otherwise we'll get "You are in 'detached HEAD' state..."
    SOURCE_DIR     "${CMAKE_BINARY_DIR}/third-party/pybind11-json"
    GIT_SHALLOW    ON        # No history needed (requires cmake 3.6)
    # Override default steps with no action, we just want the clone step.
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    )"#;
        let calls = cmake_find_calls(src);
        for call in calls {
            println!("{:?}", call);
        }
    }
}
