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
        rev = "a52bd243949addd82c0380093e53e21c60eced7d";
        hash = "sha256-MfqGFt/SJT+t3i61BB8Jh9/fM60exNXLD/EYVL3J1Fo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_robot_bringup";
  version = "0.34.1-1";
  src = sources.dummy_robot_bringup;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dummy_map_server dummy_sensors launch_ros robot_state_publisher ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
