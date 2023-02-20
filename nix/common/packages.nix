{ inputs
, cell
}:
let
  inherit (inputs) self nixpkgs std;
  l = nixpkgs.lib // inputs.cells.lib.lib // builtins;
in
rec {
  setupHelper = nixpkgs.nimPackages.buildNimPackage {
    pname = "ros2nix-setup-helper";
    version = "0.1.0";
    src = std.incl (self + /setuphelper) [
      (self + /setuphelper/src/setuphelper.nim)
      (self + /setuphelper/setuphelper.nimble)
    ];
  };

  setupHook = nixpkgs.makeSetupHook {
    substitutions = {
      setupHelper = "${setupHelper}/bin/setuphelper";
      isShellHook = "false";
    };
  } ./setup-hook.sh;

  wrapQt5AppsHookRos = nixpkgs.makeSetupHook {
    name = "wrap-qt5-apps-hook-ros";
    deps = [ nixpkgs.qt5.wrapQtAppsHook ];
  } ./wrap-qt-apps-hook-ros.sh;

  wrapGLAppsHook = nixpkgs.makeSetupHook {
    name = "wrap-gl-apps-hook";
    substitutions = {
      shell = "${nixpkgs.bash}/bin/bash";
    };
  } ./wrap-gl-apps-hook.sh;
}