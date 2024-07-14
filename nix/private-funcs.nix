{ lib, pkgs }:

{
  substituteSource =
    { src, substitutions }:
    pkgs.mkDerivationNoCC {
      name = "substitute-${src.name}";
      src = src;
      phases = [
        "unpackPhase"
        "patchPhase"
        "installPhase"
      ];
      patchPhase =
        let
          genLine =
            subst:
            "substituteInPlace ${
              lib.escapeShellArg [
                ("$out/" + subst.path)
                "--replace"
                subst.from
                subst.to
              ]
            }\n";
          s = lib.concatStrings (map genLine substitutions);
        in
        s;
      installPhase = ''
        cp -a $src $out
      '';
    };
}
