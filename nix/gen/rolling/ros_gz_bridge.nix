{
  actuator_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gps_msgs,
  gz_msgs_vendor,
  gz_transport_vendor,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  nav_msgs,
  pkg-config,
  rclcpp,
  rclcpp_components,
  ros_gz_interfaces,
  rosgraph_msgs,
  rosidl_pycommon,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_msgs,
  trajectory_msgs,
  vision_msgs,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    ros_gz_bridge = substituteSource {
      src = fetchgit {
        name = "ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "4d898ba19d6b57fdfab416d82bee6ce10f6d53e7";
        hash = "sha256-qY2exHAIhev0dqYwTbRnbw7Y9wUngxiFi8aHcwEhFAM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_bridge";
  version = "1.0.1-1";
  src = sources.ros_gz_bridge;
  nativeBuildInputs = [ ament_cmake ament_cmake_python pkg-config rosidl_pycommon ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ actuator_msgs geometry_msgs gps_msgs gz_msgs_vendor gz_transport_vendor launch_ros nav_msgs rclcpp rclcpp_components ros_gz_interfaces rosgraph_msgs sensor_msgs std_msgs tf2_msgs trajectory_msgs vision_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
