{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_cmake_pclint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  substituteSource,
}:
let
  sources = rec {
    apex_test_tools = substituteSource {
      src = fetchgit {
        name = "apex_test_tools-source";
        url = "https://github.com/ros2-gbp/apex_test_tools-release.git";
        rev = "425ca25bee2edc8f397a0e97ade0ebbe7df83cca";
        hash = "sha256-vrX5LngYVt0Fxd0td4idUCVPg+j96W7S07zUG/lM8W4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apex_test_tools";
  version = "0.0.2-6";
  src = sources.apex_test_tools;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ];
  propagatedNativeBuildInputs = [ ament_cmake_gtest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ osrf_testing_tools_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
