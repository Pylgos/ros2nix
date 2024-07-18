{ lib, distro, poetry2nix }:

let
  systemPackagesOverlay = import ./system-packages-overlay.nix { inherit lib distro; };
  mainOverlay = import ./main-overlay.nix { inherit lib distro; };
in
lib.composeManyExtensions [
  poetry2nix.overlays.default
  systemPackagesOverlay
  mainOverlay
]
