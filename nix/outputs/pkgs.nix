{ inputs, cell }:
let
  inherit (inputs) cells;
in
{
  humble = cells.humble.packages;
}