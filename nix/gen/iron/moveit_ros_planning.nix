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
  fmt,
  generate_parameter_library,
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
        rev = "ef058c543bf586bf0645b12ed2e028b7eaeb6bab";
        hash = "sha256-byMfapAODGvHvRn5OPTMw4+7rqpxlvDg+XhWgZ1uo5Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_planning";
  version = "2.8.0-1";
  src = sources.moveit_ros_planning;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen fmt generate_parameter_library message_filters moveit_common moveit_core moveit_msgs moveit_ros_occupancy_map_monitor pluginlib rclcpp rclcpp_action srdfdom tf2 tf2_eigen tf2_geometry_msgs tf2_msgs tf2_ros urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
