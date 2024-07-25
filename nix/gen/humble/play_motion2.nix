{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  control_msgs,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  joint_state_broadcaster,
  joint_trajectory_controller,
  launch,
  launch_pal,
  launch_ros,
  launch_testing_ament_cmake,
  lifecycle_msgs,
  moveit_ros_planning_interface,
  play_motion2_msgs,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  robot_state_publisher,
  sensor_msgs,
  substituteSource,
  trajectory_msgs,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    play_motion2 = substituteSource {
      src = fetchgit {
        name = "play_motion2-source";
        url = "https://github.com/pal-gbp/play_motion2-release.git";
        rev = "d4df1ec6b6195abbe0491ab29deddcab7b64cd55";
        hash = "sha256-DDfg7q95lAmY3mGybGXvlMPM28hQT91ou/9yrB8Rzjc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "play_motion2";
  version = "1.1.2-1";
  src = sources.play_motion2;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs controller_manager_msgs launch_ros lifecycle_msgs moveit_ros_planning_interface play_motion2_msgs rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
