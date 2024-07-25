{
  ackermann_steering_controller,
  ament_cmake,
  ament_cmake_gtest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  control_msgs,
  diff_drive_controller,
  effort_controllers,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  hardware_interface,
  ign_ros2_control,
  imu_sensor_broadcaster,
  joint_state_broadcaster,
  joint_trajectory_controller,
  launch,
  launch_ros,
  rclcpp,
  rclcpp_action,
  robot_state_publisher,
  ros2controlcli,
  ros2launch,
  ros_gz_bridge,
  ros_ign_gazebo,
  std_msgs,
  substituteSource,
  tricycle_controller,
  velocity_controllers,
  xacro,
}:
let
  sources = rec {
    ign_ros2_control_demos = substituteSource {
      src = fetchgit {
        name = "ign_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "4c8a5b19b10b6ee952a50690dc94bcf6e202ed7f";
        hash = "sha256-JtBt9rwqlLvpe7juGLNaguVITAoeQ/idtFwozOe3T1o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ign_ros2_control_demos";
  version = "0.7.9-1";
  src = sources.ign_ros2_control_demos;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ackermann_steering_controller control_msgs diff_drive_controller effort_controllers geometry_msgs hardware_interface ign_ros2_control imu_sensor_broadcaster joint_state_broadcaster joint_trajectory_controller launch_ros rclcpp rclcpp_action robot_state_publisher ros2controlcli ros2launch ros_gz_bridge ros_ign_gazebo std_msgs tricycle_controller velocity_controllers xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
