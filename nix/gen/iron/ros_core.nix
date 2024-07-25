{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  common_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  launch_xml,
  launch_yaml,
  pluginlib,
  rcl_lifecycle,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  rclpy,
  ros2cli_common_extensions,
  ros2launch,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  sros2,
  sros2_cmake,
  substituteSource,
}:
let
  sources = rec {
    ros_core = substituteSource {
      src = fetchgit {
        name = "ros_core-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "4dd21e8d8941f02092dad9c383fd4c07f257ae38";
        hash = "sha256-Oq1qKMDCrNKnoDWlaZtBuCMhiDEWEaPoyvkumjxWuFg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_core";
  version = "0.10.0-3";
  src = sources.ros_core;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest ament_cmake_ros ament_index_cpp ament_index_python launch launch_testing launch_testing_ament_cmake launch_xml launch_yaml ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_auto ament_lint_common class_loader common_interfaces launch_ros launch_testing_ros pluginlib rcl_lifecycle rclcpp rclcpp_action rclcpp_lifecycle rclpy ros2cli_common_extensions ros2launch rosidl_default_runtime sros2 sros2_cmake ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
