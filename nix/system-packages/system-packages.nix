{ nixpkgs
, py3version
, py2version
# , misc
} @ args:

(import ./nixpkgs.nix args)
// (import ./ignition args)
# // (import ./misc.nix args)
// (import ./colcon args)
