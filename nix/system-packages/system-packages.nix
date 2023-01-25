{ nixpkgs
, py3version
, py2version
, ignition
, misc
} @ args:

(import ./nixpkgs.nix args) // (import ./ignition.nix args) // (import ./misc.nix args)
