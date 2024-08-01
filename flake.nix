{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    dream2nix.url = "github:nix-community/dream2nix";
    dream2nix.inputs.nixpkgs.follows = "nixpkgs";
    poetry2nix.url = "github:nix-community/poetry2nix";
    nix-filter.url = "github:numtide/nix-filter";
    nix-fast-build.url = "github:Mic92/nix-fast-build";
    nix-fast-build.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      dream2nix,
      poetry2nix,
      nix-filter,
      nix-fast-build,
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
        selfPackages = self.packages.${system};
        nix-fast-build-pkg = nix-fast-build.packages.${system}.nix-fast-build;
        filter = nix-filter.lib;
      in
      {
        legacyPackages = lib.mapAttrs (
          name: overlay:
          import nixpkgs {
            inherit system;
            overlays = [ overlay ];
          }
        ) self.overlays;
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
        devShells = {
          ci = pkgs.mkShell {
            nativeBuildInputs = [
              selfPackages.ros2nix
              nix-fast-build-pkg
            ];
          };
        };
      }
    ))
    // {
      lib.distributions = [
        "humble"
        "iron"
        "jazzy"
      ];
      lib.defaultConfig = {
        distro = "jazzy";
      };
      lib.mkOverlay = (
        { config }:
        import ./overlay.nix {
          inherit lib poetry2nix;
          config = self.lib.defaultConfig // config;
        }
      );
      overlays =
        (lib.listToAttrs (
          map (name: {
            inherit name;
            value = self.lib.mkOverlay {
              config = {
                distro = name;
              };
            };
          }) self.lib.distributions
        ))
        // {
          default = self.overlays.jazzy;
        };
    };
}
