{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cpplint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_cpplint = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "6fa4ebcb74b268109e9408767611d53de203b886";
        hash = "sha256-NlV7pMgPUvuCaJDQZvoVe+XN9XaEYjrblrnSdqRsPac=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_cpplint";
  version = "0.12.11-1";
  src = sources.ament_cmake_cpplint;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_cpplint ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
