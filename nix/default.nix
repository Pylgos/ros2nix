{ lib }:
final: prev:

let
in {
  rosPackages = {
    jazzy = final.makeScopeWithSplicing' {
      otherSplices = final.generateSplicesForMkScope "rosPackages.jazzy";
      f = import ./gen/jazzy.nix;
    };
  };
}

