use std::fmt::Display;

use crate::source::Source;

pub struct PatchedSource {
    pub source: Source,
    pub substitutions: Vec<Replace>,
}

pub struct Replace {
    pub path: String,
    pub from: String,
    pub with: Replacement,
}

pub enum Replacement {
    Path(PatchedSource),
}

impl Display for Replacement {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Replacement::Path(src) => write!(f, "PATH {}", src.source.name()),
        }
    }
}

pub fn autopatch_source(src: &Source) -> PatchedSource {
    PatchedSource {
        source: src.clone(),
        substitutions: vec![],
    }
}
