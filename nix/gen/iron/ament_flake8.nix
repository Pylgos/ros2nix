{
  ament_lint,
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
    ament_flake8 = substituteSource {
      src = fetchgit {
        name = "ament_flake8-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "6137c76863857dd690a23c408e7236042abafc0c";
        hash = "sha256-i5GrxGgePMvAEuQmWpSDoCLn2ICJB9AKI2ZJ6W8UhY0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_flake8";
  version = "0.14.3-1";
  src = sources.ament_flake8;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint buildPackages.python3Packages.flake8 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint python3Packages.flake8 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
