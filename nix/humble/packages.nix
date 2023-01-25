{ inputs
, cell
}:
let
  inherit (inputs) self nixpkgs;
  l = nixpkgs.lib // inputs.cells.lib.lib // builtins;

  sysPkgs = inputs.cells.system-packages.lib.instantiateSystemPackageSet {
    inherit nixpkgs;
    py3version = "310";
    py2version = "27";
  };
  rosPkgs = l.loadRosPackagesFromJson pkgs "humble" "${self}/generator/packages.json";
  pkgs = sysPkgs // rosPkgs;
in
  rosPkgs