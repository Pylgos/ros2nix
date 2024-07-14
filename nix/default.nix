{ lib, distro }@args:

let
  mainOverlay = import ./main-overlay.nix args;
  systemPackagesOverlay = import ./system-packages-overlay.nix args;
in
lib.composeManyExtensions [
  systemPackagesOverlay
  mainOverlay
]
