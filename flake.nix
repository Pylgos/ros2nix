# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/22.11";
    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { std, self, ... } @ inputs: std.growOn
    {
      inherit inputs;
      cellsFrom = ./nix;
      cellBlocks = with std.blockTypes; [
        (installables "packages")
        (functions "lib")
      ];
    }
    {
      packages = std.harvest self [ "humble" "packages" ];
      lib = std.harvest self [ "common" "lib" ];
    };
}
