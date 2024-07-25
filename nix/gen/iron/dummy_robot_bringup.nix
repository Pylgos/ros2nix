{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dummy_map_server,
  dummy_sensors,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  robot_state_publisher,
  substituteSource,
}:
let
  sources = rec {
    dummy_robot_bringup = substituteSource {
      src = fetchgit {
        name = "dummy_robot_bringup-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "2affdb6a931e9d8964893bd78752da6c40627863";
        hash = "sha256-u5Eo+P4F81Lj8LRJCW1Ll2GhkAvARvsL7YG2qv4st5c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_robot_bringup";
  version = "0.27.1-1";
  src = sources.dummy_robot_bringup;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dummy_map_server dummy_sensors launch_ros robot_state_publisher ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
