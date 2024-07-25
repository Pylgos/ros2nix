{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_msgs,
  grid_map_ros,
  nav_msgs,
  rclcpp,
  sensor_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    grid_map_visualization = substituteSource {
      src = fetchgit {
        name = "grid_map_visualization-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "73256b79cea5c2f6f2e7ca87b79e11bbf6373731";
        hash = "sha256-iA2W/pWsMO8IDkTe2rTqNNlgg3U+2Pw8X3796L9WhRw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_visualization";
  version = "2.0.0-1";
  src = sources.grid_map_visualization;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core grid_map_msgs grid_map_ros nav_msgs rclcpp sensor_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
