{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_cv,
  grid_map_filters,
  grid_map_loader,
  grid_map_msgs,
  grid_map_octomap,
  grid_map_ros,
  grid_map_rviz_plugin,
  grid_map_visualization,
  octomap_msgs,
  octomap_rviz_plugins,
  octomap_server,
  python3Packages,
  rclcpp,
  rclpy,
  rviz2,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    grid_map_demos = substituteSource {
      src = fetchgit {
        name = "grid_map_demos-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "5e32652f29617cf63c9ed26d43bfaadee92a2364";
        hash = "sha256-q7fWY+Cu8mF2OcTaZsHYHgPQa7qmLOQDDVULNI45itw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_demos";
  version = "2.0.0-1";
  src = sources.grid_map_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs grid_map_cmake_helpers grid_map_core grid_map_cv grid_map_filters grid_map_loader grid_map_msgs grid_map_octomap grid_map_ros grid_map_rviz_plugin grid_map_visualization octomap_msgs octomap_rviz_plugins octomap_server python3Packages.opencv4 rclcpp rclpy rviz2 sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
