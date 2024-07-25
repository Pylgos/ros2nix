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
        rev = "6f2ec79fdede246ac7717267cb9e60049b4bff2a";
        hash = "sha256-TAmkaNYfx8pbsh4fl1UGyTy/jxdLsdVdec0+LoQkgxs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_spdlog";
  version = "3.2.0-1";
  src = sources.rcl_logging_spdlog;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_logging_interface rcpputils rcutils spdlog spdlog_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
