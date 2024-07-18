use std::{collections::HashMap, fmt::Display, fs, path::Path};

use anyhow::Result;

use crate::source::Source;

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct PatchedSource {
    pub source: Source,
    pub substitutions: Vec<Substitution>,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct Substitution {
    pub path: String,
    pub from: String,
    pub with: Replacement,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
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
    args: String,
}

fn find_cmake_call(src: &str) -> Vec<CMakeCall> {
    let mut calls = Vec::new();
    let mut chars = src.chars();
    let mut prev_ident = None;
    loop {
        let Some(c) = chars.next() else { break; };
        match c {
            '#' => {
                while let Some(c) = chars.next() {
                    if c == '\n' {
                        break;
                    }
                }
            }
            ' ' | '\t' | '\n' => {}
            'a'..='z' | 'A'..='Z' | '_' => {
                let mut ident = String::new();
                ident.push(c);
                while let Some(c) = chars.clone().next() {
                    match c {
                        'a'..='z' | 'A'..='Z' | '0'..='9' | '_' => {
                            ident.push(c);
                            chars.next();
                        }
                        _ => {
                            prev_ident = Some(ident);
                            break;
                        }
                    }
                }
            }
            '(' => {
                let func = prev_ident.take();
                let mut depth = 1;
                let mut args = String::new();
                while let Some(c) = chars.next() {
                    match c {
                        '(' => depth += 1,
                        ')' => {
                            depth -= 1;
                            if depth == 0 {
                                break;
                            }
                        }
                        _ => {
                            args.push(c)
                        }
                    }
                }
                if let Some(func) = func {
                    calls.push(CMakeCall { func, args });
                }
            }
            _ => {}
        }
    }
    calls
}



fn autopatch_cmake_vendor(path: &Path) -> Result<Vec<Substitution>> {
    let content = fs::read_to_string(path).unwrap();
    let calls = find_cmake_call(&content);

    let mut vars = HashMap::new();
    for call in calls {
        match call.func.to_ascii_lowercase().as_str() {
            "set" => {
                let mut parts = call.args.split(' ');
                let name = parts.next().unwrap();
                let value = parts.next().unwrap();
                vars.insert(name.to_string(), value.to_string());
            }
            "externalproject_add" => {
                call.args;
            }
            _ => {}
        }
    }
    
    Ok(vec![])
}

pub fn autopatch_source(src: &Source) -> PatchedSource {
    src.path();

    PatchedSource {
        source: src.clone(),
        substitutions: vec![],
    }
}


#[cfg(test)]
mod test {
    use std::path::PathBuf;

    use super::*;

    fn resource_dir() -> PathBuf {
        PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("resources").join("test")
    }

    #[test]
    fn test_find_cmake_call() {
        let src = fs::read_to_string(resource_dir().join("cmake").join("foonathan_memory_vendor-CMakeLists.txt")).unwrap();
        let calls = find_cmake_call(&src);
        println!("{:?}", calls);
    }
}