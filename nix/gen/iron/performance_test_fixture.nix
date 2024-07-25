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
        rev = "adba2bd7ca271f7f0d1bf0cbd35ece1d8b56ac49";
        hash = "sha256-9QfaxEneeHGL3pKTKSSetTk9YJu07uJPOZ/vgl3dQpU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "performance_test_fixture";
  version = "0.1.1-2";
  src = sources.performance_test_fixture;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_export_targets ament_cmake_test ];
  propagatedNativeBuildInputs = [ ament_cmake_google_benchmark google_benchmark_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ osrf_testing_tools_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
