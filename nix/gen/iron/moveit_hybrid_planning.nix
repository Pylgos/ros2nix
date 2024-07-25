{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  moveit_msgs,
  moveit_planners_ompl,
  moveit_resources_panda_moveit_config,
  moveit_ros_planning,
  moveit_ros_planning_interface,
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
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_hybrid_planning = substituteSource {
      src = fetchgit {
        name = "moveit_hybrid_planning-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "1b746be52bb5ae65e1c68eda96f67347eeed3342";
        hash = "sha256-jLrAp8boNrUEU7R/AgNxvXl567eXlE4k9+8wjqOW4mU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_hybrid_planning";
  version = "2.8.0-1";
  src = sources.moveit_hybrid_planning;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager moveit_common moveit_core moveit_msgs moveit_resources_panda_moveit_config moveit_ros_planning moveit_ros_planning_interface pluginlib position_controllers rclcpp rclcpp_action rclcpp_components robot_state_publisher rviz2 std_msgs std_srvs tf2_ros trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
