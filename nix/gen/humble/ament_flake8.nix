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
        rev = "89c5f9386a31d84657face8370c6d8f5aa63257e";
        hash = "sha256-D0XsKXG9JA6FDQFW0rPlDE3eLlVYs7+jqBKxsViRmsA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_flake8";
  version = "0.12.11-1";
  src = sources.ament_flake8;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint buildPackages.python3Packages.flake8 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint python3Packages.flake8 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
