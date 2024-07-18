{ stdenv }:

{
  buildPhase ? null,
  installPhase ? null,
  ...
} @args:
stdenv.mkDerivation (args // {

})
