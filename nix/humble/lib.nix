{ inputs
, cell
}:
let
  l = inputs.nixpkgs.lib // inputs.cells.common.lib // builtins;
in
{
  buildRosPackage = l.buildRosPackageFor cell.packages;
  mkRosWorkspace = l.mkRosWorkspaceFor cell.packages;
}