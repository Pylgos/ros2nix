{ inputs
, cell
}:
let
  inherit (inputs) self nixpkgs;
  l = nixpkgs.lib // inputs.cells.lib.lib // builtins;
in
rec {
  setupHelper = nixpkgs.nimPackages.buildNimPackage {
    pname = "ros2nix-setup-helper";
    version = "0.1.0";
    src = "${self}/setuphelper";
  };

  setupHook = nixpkgs.makeSetupHook {
    substitutions = {
      setupHelper = "${setupHelper}/bin/setuphelper";
    };
  } ./setup-hook.sh;
}
