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
        rev = "7186d423c71c586d5b5680281a52d9d457d19498";
        hash = "sha256-s9scD8IGwCY57TBGTGoDgeG87BZWBLOfA1I1Ca6GU+M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_robot_bringup";
  version = "0.20.4-1";
  src = sources.dummy_robot_bringup;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dummy_map_server dummy_sensors launch_ros robot_state_publisher ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
