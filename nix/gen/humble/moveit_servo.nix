{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  control_msgs,
  control_toolbox,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gripper_controllers,
  joint_state_broadcaster,
  joint_trajectory_controller,
  joy,
  launch_param_builder,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_resources_panda_moveit_config,
  moveit_ros_planning_interface,
  pluginlib,
  robot_state_publisher,
  ros_testing,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_eigen,
  tf2_ros,
  trajectory_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_servo = substituteSource {
      src = fetchgit {
        name = "moveit_servo-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "70b4262e93595559d0bef1da6255c8f2dd3a818c";
        hash = "sha256-aq6VAiuIADaRVP4uWufIdyGmfzCmQPXdFU4fjIqK4s8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_servo";
  version = "2.5.5-1";
  src = sources.moveit_servo;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs control_toolbox geometry_msgs gripper_controllers joint_state_broadcaster joint_trajectory_controller joy launch_param_builder moveit_common moveit_configs_utils moveit_core moveit_msgs moveit_ros_planning_interface pluginlib robot_state_publisher sensor_msgs std_msgs std_srvs tf2_eigen tf2_ros trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
