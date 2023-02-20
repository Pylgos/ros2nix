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
    let
      name = source.name or "source";
    in
    if source.kind == "git" then
      nixpkgs.fetchgit { inherit (source) url rev hash; inherit name; }
    else if source.kind == "url" then
      nixpkgs.fetchzip { inherit (source) url hash; inherit name; }
    else
      throw "Unsupported source type";

  resolveDepsFor = rosDistroPkgs: pkgs:
    l.concatLists (map
      (pkg:
        if l.isString pkg then
          if l.isList rosDistroPkgs.${pkg} or rosDistroPkgs.systemPackages.${pkg} then
            rosDistroPkgs.${pkg} or rosDistroPkgs.systemPackages.${pkg}
          else
            [ rosDistroPkgs.${pkg} or rosDistroPkgs.systemPackages.${pkg} ]
        else if l.isDerivation pkg then
          [ pkg ]
        else
          throw "wtf"
      )
      pkgs);


  buildRosPackageFor =
    rosDistroPkgs:
    { substitutions ? [ ]
    , buildDepend ? [ ]
    , buildExportDepend ? [ ]
    , buildToolDepend ? [ ]
    , buildToolExportDepend ? [ ]
    , execDepend ? [ ]
    , testDepend ? [ ]
    , docDepend ? [ ]

    , propagatedNativeBuildInputs ? [ ]
    , nativeBuildInputs ? [ ]
    , propagatedBuildInputs ? [ ]
    , buildInputs ? [ ]
    , checkInputs ? [ ]
    , postPatch ? ""
    , preFixup ? ""
    , buildPhase ? null
    , checkPhase ? null
    , installPhase ? null
    , doCheck ? false
    , dontUseCmakeConfigure ? true
    , dontWrapQtApps ? true

    , ...
    } @ args:
    let
      resolveDeps = resolveDepsFor rosDistroPkgs;
      isQt5App =
        let
          deps = buildDepend ++ buildExportDepend;
          getDepName = dep:
            if l.isString dep then dep
            else if l.isDerivation dep then dep.pname or dep.name
            else "";
        in
        l.any (dep: (l.match ".*(qt5|qtbase5).*" (getDepName dep)) != null) deps;
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
        propagatedNativeBuildInputs = propagatedNativeBuildInputs ++
        [ cell.packages.setupHook ] ++
        (l.optional isQt5App [ cell.packages.wrapQt5AppsHookRos ]) ++
        (resolveDeps buildToolExportDepend);

        nativeBuildInputs = nativeBuildInputs ++
        [ rosDistroPkgs.systemPackages.python3-colcon-common-extensions ] ++
        (resolveDeps buildToolDepend);

        propagatedBuildInputs = propagatedBuildInputs ++
        (resolveDeps (buildExportDepend ++ execDepend ++ buildToolExportDepend));

        buildInputs = buildInputs ++
        (resolveDeps (buildDepend ++ buildToolDepend));

        checkInputs = checkInputs ++ (resolveDeps testDepend);

        postPatch = postPatch +
        l.concatMapStringsSep
          "\n"
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

        inherit doCheck dontUseCmakeConfigure dontWrapQtApps;

        buildPhase =
          if buildPhase == null then ''
            runHook preBuild

            MAKEFLAGS="-j$NIX_BUILD_CORES" colcon --log-base /build/log build \
              --paths . \
              --merge-install \
              --install-base $out \
              --build-base /build/build \
              --event-handlers console_cohesion- console_direct+ console_package_list- console_start_end- console_stderr- desktop_notification- event_log- log- log_command- status- store_result- summary- terminal_title- \
              --executor sequential \
              --cmake-args -DCMAKE_BUILD_TYPE=Release \
              --cmake-args -DBUILD_TESTING=${if doCheck then "ON" else "OFF"} \
      
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
        
        preFixup = preFixup + ''
          rm -rf /build/build
          rm -rf /build/log
        '';

        shellHook =
          l.replaceStrings
            [ "@setupHelper@" "@isShellHook@" ]
            [ "${cell.packages.setupHelper}/bin/setuphelper" "true" ]
            (l.readFile ./setup-hook.sh);
      }
    );

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

  mkRosWorkspaceFor = rosDistroPkgs:
    { name ? "ros-workspace"
    , pkgs
    } @ args:

    buildRosPackageFor rosDistroPkgs (args // {
      inherit name;
      phases = [ "buildPhase" ];
      buildDepend = pkgs;
      buildPhase = ''
        { echo "------------------------------------------------------------";
          echo " WARNING: the existence of this path is not guaranteed.";
          echo " It is an internal implementation detail for 'mkRosWorkspaceFor'.";
          echo "------------------------------------------------------------";
          echo;
          # Record all build inputs as runtime dependencies
          export;
        } >> "$out"
      '';
    });
}
