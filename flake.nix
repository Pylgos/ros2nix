{
  nixConfig ={
    extra-trusted-public-keys = "ros2nix.cachix.org-1:qeK6B6TjlrJ49Ny/pcTA5+/P0aBcA483XYgssc7ICVs=";
    extra-substituters = "https://ros2nix.cachix.org";
  };


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
        (pkgs "pkgs")
      ];
    }
    {
      lib = std.harvest self [ "common" "lib" ];
      legacyPackages = std.harvest self [ "outputs" "pkgs" ];
    };
}
