# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
      humble = std.harvest self [ "humble" "packages" ];
      # packages = std.harvest self [ "cli" "packages" ];
      lib = std.harvest self [ "lib" "lib" ];
      # p = builtins.trace self.lib.x86_64-linux (self.lib.x86_64-linux.loadRosPackagesFromJson self.p "humble" ./generator/packages.json);
    };
}
