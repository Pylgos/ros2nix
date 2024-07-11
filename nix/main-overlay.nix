{ lib, distro }:
final: prev:

let
  distrobutions = {
    jazzy = final.makeScopeWithSplicing' {
      otherSplices = final.generateSplicesForMkScope "rosPackages";
      f = import ./gen/jazzy.nix;
    };
  };
in {
  rosPackages = distrobutions.${distro};
}
