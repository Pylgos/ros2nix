{ nixpkgs, ...}:
let
  callPackage = nixpkgs.lib.callPackageWith (self // nixpkgs);
  self = {
    ignition-cmake2 = callPackage ./cmake/2.nix {};
    ignition-utils1 = callPackage ./utils/1.nix {};
    ignition-common4 = callPackage ./common/4.nix {};
    ignition-math6 = callPackage ./math/6.nix {};
    ignition-plugin1 = callPackage ./plugin/1.nix {};
    ignition-rendering5 = callPackage ./rendering/5.nix {};
    ignition-msgs7 = callPackage ./msgs/7.nix {};
    ignition-fuel-tools6 = callPackage ./fuel-tools/6.nix {};
  };
in
  self