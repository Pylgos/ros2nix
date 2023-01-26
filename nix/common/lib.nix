{ inputs
, cell
}:
let
  nixpkgs = inputs.nixpkgs;
  l = nixpkgs.lib // builtins;
  emptyDeps = {
    buildDepend = [ ];
    buildExportDepend = [ ];
    buildToolExportDepend = [ ];
    execDepend = [ ];
    docDepend = [ ];
    testDepend = [ ];
  };
in
rec {
  getSource = source:
    if source.kind == "git" then
      nixpkgs.fetchgit { inherit (source) url rev; sha256 = source.hash; }
    else if source.kind == "url" then
      nixpkgs.fetchurl { inherit (source) url; sha256 = source.hash; }
    else
      throw "Unsupported source type";


  buildRosPackageFor =
    rosDistroPkgs:
    { substitutions ? []

    , buildDepend ? [ ]
    , buildExportDepend ? [ ]
    , buildToolDepend ? [ ]
    , buildToolExportDepend ? [ ]
    , execDepend ? []
    , testDepend ? []
    , docDepend ? []

    , postSetup ? ""
    , postPatch ? ""
    , buildPhase ? null
    , checkPhase ? null
    , installPhase ? null
    , doCheck ? false
    , dontUseCmakeConfigure ? true
    , ...
    } @ args:
    let
      resolveDeps = pkgs:
        l.concatLists (map
          (pkg:
            if l.isString pkg then
              if l.isList rosDistroPkgs.${pkg} then
                rosDistroPkgs.${pkg}
              else
                [ rosDistroPkgs.${pkg} ]
            else if l.isDerivation pkg then
              [ pkg ]
            else
              throw "wtf"
          )
          pkgs);

    in
    nixpkgs.stdenv.mkDerivation (
      (l.removeAttrs args [
        "substitutions"
        "buildDepend"
        "buildExportDepend"
        "buildToolDepend"
        "buildToolExportDepend"
        "execDepend" 
        "testDepend" 
        "docDepend"
      ]) // {
      propagatedNativeBuildInputs = resolveDeps (buildToolExportDepend ++ buildToolDepend);
      nativeBuildInputs = [ rosDistroPkgs.python3-colcon-common-extensions cell.packages.setupHook ];
      propagatedBuildInputs = resolveDeps (buildExportDepend ++ buildDepend ++ execDepend);
      checkInputs = resolveDeps testDepend;

      postPatch = postPatch +
        l.concatMapStringsSep
          ";\n"
          (sub:
            if sub.kind == "patchVendor" then
              let
                source = getSource sub.to;
              in
              ''
                substituteInPlace ${l.escapeShellArgs [ sub.filename "--replace" sub.from "URL ${source}" ]}
              ''
            else
              throw "Unsupported substitution type"
          )
          substitutions;

      inherit doCheck dontUseCmakeConfigure;

      postSetup = ''

      '';

      buildPhase =
        if buildPhase == null then ''
          runHook preBuild

          colcon build \
            --merge-install \
            --install-base $out \
            --build-base /tmp \
            --event-handlers console_direct+ \
            --cmake-args -DCMAKE_BUILD_TYPE=Release \
            --cmake-args -DBUILD_TESTING=${if doCheck then "ON" else "OFF"}
        
          runHook postBuild
        '' else buildPhase;

      checkPhase =
        if checkPhase == null then ''
          runHook preCheck

          colcon test \
            --merge-install \
            --install-base $out

          runHook postCheck
        '' else checkPhase;

      installPhase =
        if installPhase == null then ''
          runHook preInstall
          runHook postInstall
        '' else installPhase;
    });

  loadRosDistroFromJson = rosDistroPkgs: distroName: jsonPath:
    let
      j = l.fromJSON (l.readFile jsonPath);
      distro = j.distributions.${distroName};
    in
    l.mapAttrs
      (packageName: package:
        buildRosPackageFor rosDistroPkgs {
          pname = packageName;
          inherit (package) version substitutions;
          inherit (package.dependencies) buildDepend buildExportDepend buildToolDepend buildToolExportDepend execDepend testDepend docDepend;
          src = getSource package.source;
        }
      )
      distro.packages;
}
