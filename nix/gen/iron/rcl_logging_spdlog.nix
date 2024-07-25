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
        rev = "3df39c5dbf6d0a5d93ea4add8107d6b1510f0074";
        hash = "sha256-Ch87CHeXupkqcuLp1MzYtg/KePT8y59TgD8Dt/E5EGA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_spdlog";
  version = "2.5.1-2";
  src = sources.rcl_logging_spdlog;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_logging_interface rcpputils rcutils spdlog spdlog_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
