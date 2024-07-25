{
  ament_flake8,
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
    ament_pep257 = substituteSource {
      src = fetchgit {
        name = "ament_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "baa494aaeac22075f15ddffb8d67ca2837ca13c9";
        hash = "sha256-cZf6ujXX9zLc834AgXqIGGgJwi/HDKDXZOHSfEXFUwQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pep257";
  version = "0.12.11-1";
  src = sources.ament_pep257;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint buildPackages.python3Packages.pydocstyle ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint python3Packages.pydocstyle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
