{ lib, distro }:
final: prev:

let
  private-funcs = import ./private-funcs.nix {
    inherit lib;
    pkgs = final;
  };
  distrobutions = {
    jazzy = final.makeScopeWithSplicing' {
      otherSplices = final.generateSplicesForMkScope "rosPackages";
      extra = (spliced: private-funcs);
      f = (
        self:
        { buildRosPackage = self.callPackage ./build-ros-package.nix { }; } // (import ./gen/jazzy.nix self)
      );
    };
  };
in
{
  rosPackages = distrobutions.${distro};
}
