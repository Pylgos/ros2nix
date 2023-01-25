{ inputs
, cell
}:
{
  instantiateSystemPackageSet = import ./system-packages.nix;
}