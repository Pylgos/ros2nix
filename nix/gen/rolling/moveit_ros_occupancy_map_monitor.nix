{
  ament_cmake,
  ament_cmake_gmock,
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
        rev = "fd41b05315f8e57e7ba3617880dc2023f1d5728f";
        hash = "sha256-WHbMOwEkQoPOrHQOeH/0GJyEa7g/ez3LJsJTZw6jUUw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_occupancy_map_monitor";
  version = "2.10.0-1";
  src = sources.moveit_ros_occupancy_map_monitor;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometric_shapes moveit_common moveit_core moveit_msgs pluginlib rclcpp tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}