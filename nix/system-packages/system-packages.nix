{ nixpkgs
, py3version
, py2version
} @ args:

let
  args' = args // { inherit self; };
  self =
    (import ./nixpkgs.nix args')
    // (import ./ignition args')
    // (import ./misc args')
    // (import ./colcon args');
in
  self
