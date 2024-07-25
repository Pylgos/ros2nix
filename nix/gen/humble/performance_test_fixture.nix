{
  ament_cmake_core,
  ament_cmake_export_dependencies,
  ament_cmake_export_targets,
  ament_cmake_google_benchmark,
  ament_cmake_test,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  google_benchmark_vendor,
  osrf_testing_tools_cpp,
  substituteSource,
}:
let
  sources = rec {
    performance_test_fixture = substituteSource {
      src = fetchgit {
        name = "performance_test_fixture-source";
        url = "https://github.com/ros2-gbp/performance_test_fixture-release.git";
        rev = "3949e059c67917a72d8eb73e71fc46f176c2e4ad";
        hash = "sha256-AGkyb6QjietsUExtcqvwhnGy5Sd2EFBT8JkBAd4rb4o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "performance_test_fixture";
  version = "0.0.9-1";
  src = sources.performance_test_fixture;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_export_targets ament_cmake_test ];
  propagatedNativeBuildInputs = [ ament_cmake_google_benchmark google_benchmark_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ osrf_testing_tools_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
