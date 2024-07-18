{ stdenv, buildPackages }:

{
  buildPhase ? null,
  installPhase ? null,
  ...
} @args:
stdenv.mkDerivation (args // {
  nativeBuildInputs = [ buildPackages.python3Packages.colcon-common-extensions ];

  
})
