{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    dream2nix.url = "github:nix-community/dream2nix";
    dream2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      dream2nix,
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
      lib.mkOverlay = ({ distro }: import ./overlay.nix { inherit lib distro; });
      overlays.default = self.lib.mkOverlay { distro = "jazzy"; };
    };
}
