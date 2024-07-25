{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cppcheck,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_cppcheck = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "937270c1642b899255ebbdaf76c938d623c215f3";
        hash = "sha256-MOPSuJjbd0H0JT8afHrbCZ6cadWdQBqTg+dgObh2Cfw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_cppcheck";
  version = "0.12.11-1";
  src = sources.ament_cmake_cppcheck;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cppcheck ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_test ament_cppcheck ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
