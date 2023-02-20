{ inputs, cell }:
let
  inherit (inputs) cells;
in
{
  humble = cells.humble.packages // cells.humble.lib;
  ros2nix = cells.cli.packages.ros2nix;
}