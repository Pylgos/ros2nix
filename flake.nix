{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
    }:
    let
      lib = nixpkgs.lib;
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
      overlays.default = import ./overlay.nix { inherit lib; };
    };
}
