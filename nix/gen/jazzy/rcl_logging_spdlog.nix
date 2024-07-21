{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rcl_logging_interface,
  rcpputils,
  rcutils,
  spdlog,
  spdlog_vendor,
  substituteSource,
}:
let
  sources = rec {
    rcl_logging_spdlog = substituteSource {
      src = fetchgit {
        name = "rcl_logging_spdlog-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "5648031902b5d7055b6bf46596cf424912d86a3e";
        hash = "sha256-1G9tkqVueqbs4DvEFCJyRqYkNap6ekz9JUZzdLt4emw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_spdlog";
  version = "3.1.0-2";
  src = sources.rcl_logging_spdlog;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_logging_interface rcpputils rcutils spdlog spdlog_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
