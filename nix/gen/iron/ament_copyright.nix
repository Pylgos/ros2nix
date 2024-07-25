{
  ament_flake8,
  ament_lint,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_copyright = substituteSource {
      src = fetchgit {
        name = "ament_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "f91a7584690c0fb874fc5cd20988b1f57059bd40";
        hash = "sha256-iiwHO1qPX6gMJmD47MkIWuOZXvCdcnCVVvY/HUOfYsk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_copyright";
  version = "0.14.3-1";
  src = sources.ament_copyright;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint python3Packages.importlib-metadata ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
