{
  ament_cmake_core,
  ament_cmake_test,
  ament_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_lint_cmake = substituteSource {
      src = fetchgit {
        name = "ament_cmake_lint_cmake-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "4e1e151ac367e8f2e07bceeea46a080e28906bad";
        hash = "sha256-xrkuhAa6wuZe8Q8sFzkRkEPiP0KgmBDBC7buL+izoMg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_lint_cmake";
  version = "0.12.11-1";
  src = sources.ament_cmake_lint_cmake;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_lint_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
