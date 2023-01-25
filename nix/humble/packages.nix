{ inputs
, cell
}:
let
  inherit (inputs) self nixpkgs;
  l = nixpkgs.lib // inputs.cells.lib.lib // builtins;

  sysPkgs = {};
  rosPkgs = l.loadRosPackagesFromJson pkgs "humble" "${self}/generator/packages.json";
  pkgs = sysPkgs // rosPkgs;
in
  rosPkgs