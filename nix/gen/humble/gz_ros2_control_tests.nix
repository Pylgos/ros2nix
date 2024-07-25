{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  hardware_interface,
  ign_ros2_control,
  joint_state_broadcaster,
  joint_trajectory_controller,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  python3Packages,
  rclcpp,
  rclcpp_action,
  robot_state_publisher,
  ros2controlcli,
  ros2launch,
  ros_ign_gazebo,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    gz_ros2_control_tests = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control_tests-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "7d1f058cfc650a555b8a4e7fc5d020df84df7438";
        hash = "sha256-V1HfJZBMMLqWNGCIw8EXj9XQy93kYUrOY4A00Xj/WCE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_ros2_control_tests";
  version = "0.7.9-1";
  src = sources.gz_ros2_control_tests;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python launch launch_testing_ament_cmake buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs geometry_msgs hardware_interface ign_ros2_control joint_state_broadcaster joint_trajectory_controller launch_ros python3Packages.psutil rclcpp rclcpp_action robot_state_publisher ros2controlcli ros2launch ros_ign_gazebo xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
