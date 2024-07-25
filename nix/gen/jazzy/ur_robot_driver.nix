{
  ament_cmake,
  ament_cmake_python,
  backward_ros,
  buildRosPackage,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  force_torque_sensor_broadcaster,
  geometry_msgs,
  hardware_interface,
  joint_state_broadcaster,
  joint_state_publisher,
  joint_trajectory_controller,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  pluginlib,
  position_controllers,
  rclcpp,
  rclcpp_lifecycle,
  rclpy,
  robot_state_publisher,
  ros2_controllers_test_nodes,
  rviz2,
  socat,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
  ur_client_library,
  ur_controllers,
  ur_dashboard_msgs,
  ur_description,
  ur_msgs,
  urdf,
  velocity_controllers,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    ur_robot_driver = substituteSource {
      src = fetchgit {
        name = "ur_robot_driver-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "da89ba56e5ee8b80f9a32262588dc6b254330e0d";
        hash = "sha256-F3F0pei4rPLBS2oiOhEyFPWw0sce94s2AM9Oz0M5YRs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_robot_driver";
  version = "2.4.5-1";
  src = sources.ur_robot_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_manager controller_manager_msgs force_torque_sensor_broadcaster geometry_msgs hardware_interface joint_state_broadcaster joint_state_publisher joint_trajectory_controller launch launch_ros pluginlib position_controllers rclcpp rclcpp_lifecycle rclpy robot_state_publisher ros2_controllers_test_nodes rviz2 socat std_msgs std_srvs tf2_geometry_msgs ur_client_library ur_controllers ur_dashboard_msgs ur_description ur_msgs urdf velocity_controllers xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
