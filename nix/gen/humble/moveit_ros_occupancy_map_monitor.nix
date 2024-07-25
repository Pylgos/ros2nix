{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometric_shapes,
  moveit_common,
  moveit_core,
  moveit_msgs,
  octomap,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_occupancy_map_monitor = substituteSource {
      src = fetchgit {
        name = "moveit_ros_occupancy_map_monitor-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5bbdda11e8d1f1a1610689cedcb38829f7de86ae";
        hash = "sha256-PED7tUMeKj0oNe0TKmpNwYOhh8UcIWebpduWASmC6xE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_occupancy_map_monitor";
  version = "2.5.5-1";
  src = sources.moveit_ros_occupancy_map_monitor;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometric_shapes moveit_common moveit_core moveit_msgs octomap pluginlib rclcpp tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
