use std::{
    collections::{BTreeSet, HashMap},
    fs,
    ops::Range,
    path::{Path, PathBuf},
    sync::Arc,
};

use anyhow::Result;
use futures::{
    future::{self, BoxFuture},
    stream, FutureExt, StreamExt, TryStreamExt as _,
};
use tracing::{debug, info};
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
                while let Some((_, c)) = chars.next() {
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
            while let Some(token) = tokens_iter.next() {
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
                while let Some(c) = chars.next() {
                    if c == '}' {
                        vars.get(&var).map(|v| result.push_str(v));
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

// recursive async function is not supported in Rust
// so we need this dirty workaround
fn fetch_git_substitution(
    fetcher: Arc<Fetcher>,
    name: String,
    repo: String,
    tag: String,
    path: PathBuf,
    from: String,
) -> BoxFuture<'static, Result<Substitution>> {
    async move {
        let source = fetcher.fetch_git(&name, &repo, &tag).await?;
        let patched = autopatch_source(&fetcher, &source).await?;
        Ok(Substitution {
            path,
            from,
            with: Replacement::Url(patched),
        })
    }
    .boxed()
}

async fn autopatch_cmake_vendor(
    fetcher: &Arc<Fetcher>,
    name: &str,
    path: &Path,
    rel_path: &Path,
) -> Result<BTreeSet<Substitution>> {
    let mut result = Vec::new();
    debug!("checking {path:?}");
    let content = fs::read_to_string(path).unwrap();
    let calls = cmake_find_calls(&content);

    let mut vars = HashMap::new();
    for call in calls {
        match call.func.to_ascii_lowercase().as_str() {
            "set" => {
                let (Some(first), Some(second)) = (call.args.get(0), call.args.get(1)) else {
                    continue;
                };
                let (Some(key), Some(value)) = (
                    cmake_resolve_var(&mut vars, first),
                    cmake_resolve_var(&mut vars, second),
                ) else {
                    continue;
                };
                vars.insert(key, value);
            }
            "externalproject_add" => {
                let mut args = call
                    .args
                    .iter()
                    .filter_map(|arg| {
                        if let Some(val) = cmake_resolve_var(&mut vars, arg) {
                            Some((val, arg))
                        } else {
                            None
                        }
                    })
                    .peekable();
                let mut git_repo = None;
                let mut git_tag = None;
                loop {
                    let Some(arg) = args.next() else {
                        break;
                    };
                    let maybe_next = args.peek();
                    let range = maybe_next.map(|next| arg.1.range.start..next.1.range.end);
                    match (arg.0.as_str(), maybe_next.map(|s| s.0.as_str())) {
                        ("GIT_REPOSITORY", Some(url)) => {
                            git_repo = Some((url.to_string(), range.unwrap()));
                        }
                        ("GIT_TAG", Some(tag)) => {
                            git_tag = Some((tag.to_string(), range.unwrap()));
                        }
                        _ => {}
                    }
                }
                if let (Some(repo), Some(tag)) = (git_repo, git_tag) {
                    let name = format!("{name}-vendor_source{}", result.len());
                    let from = content[repo.1.clone()].to_string();
                    let fut = fetch_git_substitution(
                        fetcher.clone(),
                        name,
                        repo.0,
                        tag.0,
                        rel_path.to_path_buf(),
                        from,
                    );
                    let fut = tokio::spawn(fut);
                    result.push(fut);
                }
            }
            _ => {}
        }
    }

    stream::iter(result)
        .buffer_unordered(32)
        .then(|res| future::ready(res.unwrap()))
        .try_collect()
        .await
}

pub async fn autopatch_source(fetcher: &Arc<Fetcher>, src: &Source) -> Result<PatchedSource> {
    info!("autopatching {name}", name = src.name());
    let mut substitutions = BTreeSet::new();

    for file in WalkDir::new(src.path()) {
        let file = file?;
        if file.file_type().is_dir() {
            continue;
        }
        let rel_path = file.path().strip_prefix(src.path())?;
        let filename = file.file_name().to_string_lossy();
        if filename == "CMakeLists.txt"
            || filename.ends_with(".cmake")
            || filename.ends_with(".cmake.in")
        {
            let subst = autopatch_cmake_vendor(fetcher, src.name(), file.path(), rel_path).await?;
            substitutions.extend(subst);
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
        let subs = autopatch_cmake_vendor(
            &fetcher,
            "foonathan_memory_vendor",
            &base_path.join(&rel_path),
            &rel_path,
        )
        .await
        .unwrap();
        for sub in subs.iter() {
            println!("{:?}", sub);
        }
        subs.iter().next().unwrap();
    }
}
