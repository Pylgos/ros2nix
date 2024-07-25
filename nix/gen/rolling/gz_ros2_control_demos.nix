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
  gz_ros2_control,
  hardware_interface,
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
  ros_gz_sim,
  std_msgs,
  substituteSource,
  tricycle_controller,
  velocity_controllers,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    gz_ros2_control_demos = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "cacb93ee066408131335e396b8742abe7bceca87";
        hash = "sha256-qDbZzkiayVUCmORL7ZKOcy02N/Spb8bInKdUcFZba2A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_ros2_control_demos";
  version = "1.3.1-1";
  src = sources.gz_ros2_control_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ackermann_steering_controller control_msgs diff_drive_controller effort_controllers geometry_msgs gz_ros2_control hardware_interface imu_sensor_broadcaster joint_state_broadcaster joint_trajectory_controller launch_ros rclcpp rclcpp_action robot_state_publisher ros2controlcli ros2launch ros_gz_bridge ros_gz_sim std_msgs tricycle_controller velocity_controllers xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
