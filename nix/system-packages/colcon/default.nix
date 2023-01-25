
{ nixpkgs
, py3version
, ...
}:
let
  py3pkgs = nixpkgs."python${py3version}Packages";
in
{
  python3-colcon-common-extensions = py3pkgs.callPackage ./common-extensions.nix {};
}