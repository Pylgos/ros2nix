{
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
  gazebo_ros,
  gazebo_ros2_control,
  geometry_msgs,
  hardware_interface,
  joint_state_broadcaster,
  joint_trajectory_controller,
  launch,
  launch_ros,
  rclcpp,
  rclcpp_action,
  robot_state_publisher,
  ros2_control,
  std_msgs,
  substituteSource,
  tricycle_controller,
  velocity_controllers,
  xacro,
}:
let
  sources = rec {
    gazebo_ros2_control_demos = substituteSource {
      src = fetchgit {
        name = "gazebo_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/gazebo_ros2_control-release.git";
        rev = "13fa71c72f7f8e43bb37858512351688e578aa02";
        hash = "sha256-oxMTc9LtG/Gapj5ZBneLmbgLh1UXvZtkOuekoLBXa+M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_ros2_control_demos";
  version = "0.6.7-1";
  src = sources.gazebo_ros2_control_demos;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs diff_drive_controller effort_controllers gazebo_ros gazebo_ros2_control geometry_msgs hardware_interface joint_state_broadcaster joint_trajectory_controller launch_ros rclcpp rclcpp_action robot_state_publisher ros2_control std_msgs tricycle_controller velocity_controllers xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
