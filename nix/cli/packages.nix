{ inputs
, cell
}:
let
  inherit (inputs) self std nimble2nix nixpkgs;
in
{
  ros2nix = (nimble2nix.packages.buildNimblePackage {
    pname = "ros2nix";
    version = "0.1.0";
    src = std.incl (self + /ros2nix) [
      (self + /ros2nix)
    ];
    nativeBuildInputs = [ nixpkgs.makeWrapper ];
  }).overrideAttrs (oldAttrs:
    let
      binPath = nixpkgs.lib.makeBinPath [
        inputs.nix-eval-jobs.packages.nix-eval-jobs
        nixpkgs.nix-prefetch-git
      ];
    in
    {
      postFixup = ''
        wrapProgram $out/bin/ros2nix --prefix PATH : '${binPath}'
      '';
    });
}
