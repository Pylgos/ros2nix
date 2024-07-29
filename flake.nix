{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    dream2nix.url = "github:nix-community/dream2nix";
    dream2nix.inputs.nixpkgs.follows = "nixpkgs";
    poetry2nix.url = "github:nix-community/poetry2nix";
    nix-filter.url = "github:numtide/nix-filter";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      dream2nix,
      poetry2nix,
      nix-filter,
    }:
    let
      lib = nixpkgs.lib // {
        dream2nix = dream2nix.lib;
      };
    in
    (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        filter = nix-filter.lib;
      in
      {
        legacyPackages = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        };
        packages = {
          ros2nix = pkgs.callPackage (
            {
              rustPlatform,
              pkg-config,
              openssl,
            }:
            rustPlatform.buildRustPackage {
              pname = "ros2nix";
              version = "0.1.0";
              src = filter {
                root = ./.;
                include = [
                  "Cargo.toml"
                  "Cargo.lock"
                  "build.rs"
                  "src"
                ];
              };
              cargoLock.lockFile = ./Cargo.lock;
              nativeBuildInputs = [ pkg-config ];
              buildInputs = [ openssl ];
              doCheck = false;
            }
          ) { };
        };
      }
    ))
    // {
      lib.mkOverlay = (
        { config }:
        import ./overlay.nix {
          inherit lib poetry2nix;
          config = self.lib.defaultConfig // config;
        }
      );
      lib.defaultConfig = {
        distro = "rolling";
      };
      overlays.default = self.lib.mkOverlay { config = self.lib.defaultConfig; };
    };
}
