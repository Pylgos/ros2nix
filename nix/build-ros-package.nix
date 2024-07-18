{ stdenv, buildPackages }:

{
  configurePhase ? null,
  buildPhase ? null,
  installPhase ? null,
  checkPhase ? null,
  preFixup ? "",
  doCheck ? false,
  ...
}@args:
stdenv.mkDerivation (
  args
  // {
    nativeBuildInputs = [ buildPackages.python3Packages.colcon-common-extensions ];

    buildPhase =
      if buildPhase == null then
        ''
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
        ''
      else
        buildPhase;

    installPhase =
      if installPhase == null then
        ''
          runHook preInstall
          runHook postInstall
        ''
      else
        installPhase;

    checkPhase =
      if checkPhase == null then
        ''
          runHook preCheck

          colcon test \
            --merge-install \
            --install-base $out

          runHook postCheck
        ''
      else
        checkPhase;

    preFixup =
      preFixup
      + ''
        rm -rf /build/build
        rm -rf /build/log
      '';
  }
)
