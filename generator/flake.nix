{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/22.05";
    flake-utils.url = "github:numtide/flake-utils";
    nimble2nix.url = "github:bandithedoge/nimble2nix";
    nimble2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, nimble2nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            nimble2nix.overlay
          ];
        };
      in rec
      {
        packages.ros2nix = pkgs.buildNimblePackage {
          pname = "ros2nix";
          version = "0.1.0";
          src = ./.;
        };
        packages.default = packages.ros2nix;
      }
    );
}

