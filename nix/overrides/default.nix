{ lib, config }:

if config.distro == "jazzy" then
  import ./jazzy.nix
else
  (final: prev: {})
