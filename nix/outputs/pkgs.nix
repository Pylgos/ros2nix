{ inputs, cell }:
let
  inherit (inputs) cells;
in
{
  humble = cells.humble.packages;
  ros2nix = cells.cli.packages.ros2nix;
}