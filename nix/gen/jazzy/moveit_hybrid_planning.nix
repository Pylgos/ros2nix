{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_planners_ompl,
  moveit_resources_panda_moveit_config,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  moveit_simple_controller_manager,
  pluginlib,
  position_controllers,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  robot_state_publisher,
  ros_testing,
  rviz2,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_ros,
  trajectory_msgs,
}:
let
  sources = rec {
    moveit_hybrid_planning = substituteSource {
      src = fetchgit {
        name = "moveit_hybrid_planning-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "85a5b5c67eb522f7730ee025c2e603c36e4acaeb";
        hash = "sha256-KUzQByTujYnu6ZUbStJRiivd3oUpOSdi34fHHSs9Zy0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_hybrid_planning";
  version = "2.10.0-1";
  src = sources.moveit_hybrid_planning;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp controller_manager moveit_common moveit_core moveit_msgs moveit_resources_panda_moveit_config moveit_ros_planning moveit_ros_planning_interface pluginlib position_controllers rclcpp rclcpp_action rclcpp_components robot_state_publisher rviz2 std_msgs std_srvs tf2_ros trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
