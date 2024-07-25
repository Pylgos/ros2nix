{
  actuator_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gps_msgs,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  nav_msgs,
  pkg-config,
  rclcpp,
  rclcpp_components,
  ros_gz_interfaces,
  rosgraph_msgs,
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
        rev = "29612fb2dbe9c6a21fe1242a25c2eea9a976610a";
        hash = "sha256-vTDjdsY9+n76jN/c+KTjl5s3ozlaf2BeTh1HtdxRtrI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_bridge";
  version = "0.244.15-1";
  src = sources.ros_gz_bridge;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ actuator_msgs geometry_msgs gps_msgs nav_msgs rclcpp rclcpp_components ros_gz_interfaces rosgraph_msgs sensor_msgs std_msgs tf2_msgs trajectory_msgs vision_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
