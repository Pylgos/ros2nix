#!/usr/bin/env bash

set -e
cd "$(git rev-parse --show-toplevel)" || exit 1
find . -type f -name '*.nix' -not -path './nix/gen/**' -exec nixfmt --check {} +
cargo fmt --check
