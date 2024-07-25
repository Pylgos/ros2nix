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
        rev = "666562d7462bfbdd5a582947900a5d18471ac20a";
        hash = "sha256-s8s0zWINJjyn9jqi0uJEK+LBeJkH6ItMg/FiSjOD2/c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_bridge";
  version = "0.254.1-1";
  src = sources.ros_gz_bridge;
  nativeBuildInputs = [ ament_cmake pkg-config rosidl_pycommon ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ actuator_msgs geometry_msgs nav_msgs rclcpp rclcpp_components ros_gz_interfaces rosgraph_msgs sensor_msgs std_msgs tf2_msgs trajectory_msgs vision_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
