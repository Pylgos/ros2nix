{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  moveit_common,
  moveit_core,
  moveit_msgs,
  moveit_resources_panda_moveit_config,
  moveit_ros_occupancy_map_monitor,
  pluginlib,
  rclcpp,
  rclcpp_action,
  ros_testing,
  srdfdom,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_msgs,
  tf2_ros,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_planning = substituteSource {
      src = fetchgit {
        name = "moveit_ros_planning-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5b79cf2c979996761f7c074526962f9dad8a8ccc";
        hash = "sha256-xyXZNlNknJIlOE7jj33pwRkfQM1+qw6R4Y9eyQFYfx4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_planning";
  version = "2.5.5-1";
  src = sources.moveit_ros_planning;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen message_filters moveit_common moveit_core moveit_msgs moveit_ros_occupancy_map_monitor pluginlib rclcpp rclcpp_action srdfdom tf2 tf2_eigen tf2_geometry_msgs tf2_msgs tf2_ros urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
