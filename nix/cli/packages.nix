{ inputs
, cell
}:
let
  inherit (inputs) self std nimble2nix;
in
{
  ros2nix = nimble2nix.packages.buildNimblePackage {
    pname = "ros2nix";
    version = "0.1.0";
    src = std.incl (self + /ros2nix) [
      (self + /ros2nix)
    ];
  };
}