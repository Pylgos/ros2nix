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
      nixpkgs.fetchGit { inherit (source) url hash rev; }
    else if source.kind == "url" then
      nixpkgs.fetchUrl { inherit (source) url hash; }
    else
      throw "Unsupported source type";


  buildRosPackage =
    rosDistroPkgs:
    { substitutions ? { }
    , buildDepend ? [ ]
    , buildExportDepend ? [ ]
    , buildToolDepend ? [ ]
    , buildToolExportDepend ? [ ]
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
      resolveDeps =
        pkgs:
        l.concatLists
          (
            map
              (pkg:
              if l.isString pkg then
                rosDistroPkgs.${pkg}
              else if l.isDerivation then
                [ pkg ]
              else
                throw "wtf"
              )
              pkgs
          );
    in
    nixpkgs.stdenv.mkDerivation (args // {
      propagatedNativeBuildInputs = resolveDeps buildToolExportDepend;
      nativeBuildInputs = resolveDeps ((l.subtractLists buildToolExportDepend buildToolDepend) ++ [ rosDistroPkgs.python3-colcon-common-extensions ]);
      propagatedBuildInputs = resolveDeps buildExportDepend;
      buildInputs = resolveDeps (l.subtractLists buildExportDepend buildDepend);

      postPatch = postPatch +
        l.concatMapStringSep
          ";\n"
          (sub:
            if sub.kind == "replaceToPath" then
              let
                source = getSource sub.to;
              in
              ''
                substituteInPlace ${l.escapeShellArgs [ sub.filename "--replace" sub.from "${source}" ]}
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

  loadRosPackagesFromJson = rosPkgs: distroName: jsonPath:
    let
      j = l.fromJSON (l.readFile jsonPath);
      distro = j.distributions.${distroName};
    in
    l.mapAttrs
      (packageName: package:
        buildRosPackage distro.packages {
          pname = packageName;
          inherit (package) version substitutions;
          inherit (package.dependencies) buildDepend buildExportDepend buildToolDepend buildToolExportDepend;
          src = getSource package.source;
        }
      )
      distro.packages;
    }
