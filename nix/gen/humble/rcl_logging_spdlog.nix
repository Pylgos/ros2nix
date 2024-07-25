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
        rev = "de9bb38d1f12fbcdbd476ad54a86449bb29d2e5f";
        hash = "sha256-mdIICS8v4njC0+FRKpzz93HaVZmfalZCUoIdUnGbgJ8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_spdlog";
  version = "2.3.1-1";
  src = sources.rcl_logging_spdlog;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_logging_interface rcpputils rcutils spdlog spdlog_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
