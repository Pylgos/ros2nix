{ lib, distro }:
final: prev:

let
  private-funcs = import ./private-funcs.nix {
    inherit lib;
    pkgs = final;
  };
  common = self: {
    ros-setup-helper = self.callPackage ./setup-helper.nix { };
    wrapRosQtAppsHook = self.callPackage ./wrap-ros-qt-apps-hook.nix { };
    rosSetupHook = self.callPackage ./setup-hook.nix { };
    buildRosPackage = self.callPackage ./build-ros-package.nix { };
  };
  distrobutions = {
    jazzy = final.makeScopeWithSplicing' {
      otherSplices = final.generateSplicesForMkScope "rosPackages";
      extra = (spliced: private-funcs);
      f = (self: (common self) // (import ./gen/jazzy self));
    };
  };
in
{
  rosPackages = distrobutions.${distro};
}
