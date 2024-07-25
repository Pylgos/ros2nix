{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward_command_controller,
  hardware_interface,
  joint_state_broadcaster,
  joint_state_publisher_gui,
  joint_trajectory_controller,
  pluginlib,
  qb_softhand_industry_msgs,
  qb_softhand_industry_srvs,
  rclcpp,
  rclcpp_lifecycle,
  robot_state_publisher,
  ros2_controllers_test_nodes,
  ros2controlcli,
  ros2launch,
  rviz2,
  substituteSource,
  transmission_interface,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    qb_softhand_industry_ros2_control = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry_ros2_control-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "a5a4951989afebf8fb8249771f0328562ee4b3d2";
        hash = "sha256-1Di2yWEnL94/mBE5fF2Zb7+U3JL2h5GdVUbkURlqL3M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_softhand_industry_ros2_control";
  version = "2.1.2-4";
  src = sources.qb_softhand_industry_ros2_control;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager forward_command_controller hardware_interface joint_state_broadcaster joint_state_publisher_gui joint_trajectory_controller pluginlib qb_softhand_industry_msgs qb_softhand_industry_srvs rclcpp rclcpp_lifecycle robot_state_publisher ros2_controllers_test_nodes ros2controlcli ros2launch rviz2 transmission_interface xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
