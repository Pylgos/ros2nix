{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_mypy,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_mypy = substituteSource {
      src = fetchgit {
        name = "ament_cmake_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "e2de1075200b479701bc0e8f4bae6227ce20af9c";
        hash = "sha256-weKbvoYzWXrrqPMy2JmlngQjiE5sJ5wL2adMHulGstU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_mypy";
  version = "0.12.11-1";
  src = sources.ament_cmake_mypy;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_mypy ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
