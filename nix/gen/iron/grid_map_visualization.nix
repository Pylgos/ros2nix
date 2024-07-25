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
        rev = "5d60eef0a80b0a5557c5f22fab7347638796e0e4";
        hash = "sha256-bWYF6YlX408FQXP4VUjP/kiRGszerffounQNrD9V9Z8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_visualization";
  version = "2.1.0-1";
  src = sources.grid_map_visualization;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core grid_map_msgs grid_map_ros nav_msgs rclcpp sensor_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
