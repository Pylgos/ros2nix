{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    dream2nix.url = "github:nix-community/dream2nix";
    dream2nix.inputs.nixpkgs.follows = "nixpkgs";
    poetry2nix.url = "github:nix-community/poetry2nix";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      dream2nix,
      poetry2nix,
    }:
    let
      lib = nixpkgs.lib // { dream2nix = dream2nix.lib; };
    in
    (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        legacyPackages = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        };
      }
    ))
    // {
      lib.mkOverlay = ({ config }: import ./overlay.nix { inherit lib poetry2nix; config = self.lib.defaultConfig // config; });
      lib.defaultConfig = { distro = "jazzy"; };
      overlays.default = self.lib.mkOverlay { config = self.lib.defaultConfig; };
    };
}
