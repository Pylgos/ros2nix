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
        rev = "f004b547dbaddc3fc9ec227a95dcd8535cc75d1d";
        hash = "sha256-dANrJEpwFslaMdeozkcFw2/drBbLxIzeFbFQFJYFt7k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_occupancy_map_monitor";
  version = "2.8.0-1";
  src = sources.moveit_ros_occupancy_map_monitor;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometric_shapes moveit_common moveit_core moveit_msgs octomap pluginlib rclcpp tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
