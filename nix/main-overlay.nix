{ lib, distro }:
final: prev:

let
  private-funcs = import ./private-funcs.nix {
    inherit lib;
    pkgs = final;
  };
  common = self: {
    ros-setup-helper = self.callPackage ../setup-hook/helper { };
    rosSetupHook = self.callPackage ./setup-hook.nix { };
    buildRosPackage = self.callPackage ./build-ros-package.nix { };
  };
  distrobutions = {
    jazzy = final.makeScopeWithSplicing' {
      otherSplices = final.generateSplicesForMkScope "rosPackages";
      extra = (spliced: private-funcs);
      f = (self: (common self) // (import ./gen/jazzy.nix self));
    };
  };
in
{
  rosPackages = distrobutions.${distro};
}
