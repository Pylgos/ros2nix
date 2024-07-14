{ lib, distro }:
final: prev:

let
  private-funcs = import ./private-funcs.nix { inherit lib; pkgs = final; };
  distrobutions = {
    jazzy = final.makeScopeWithSplicing' {
      otherSplices = final.generateSplicesForMkScope "rosPackages";
      extra = (spliced: private-funcs);
      f = import ./gen/jazzy.nix;
    };
  };
in {
  rosPackages = distrobutions.${distro};
}
