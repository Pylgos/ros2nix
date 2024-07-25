{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  kdl_parser,
  launch_ros,
  launch_testing_ament_cmake,
  orocos_kdl_vendor,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros,
  urdf,
}:
let
  sources = rec {
    robot_state_publisher = substituteSource {
      src = fetchgit {
        name = "robot_state_publisher-source";
        url = "https://github.com/ros2-gbp/robot_state_publisher-release.git";
        rev = "16f43bc6b145106eca33945d996c9d7fa8d1f872";
        hash = "sha256-gyP52H+6GGcGkYYITuuZd1ypVYWvMzHPYKhuv1+5KNY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_state_publisher";
  version = "3.2.1-1";
  src = sources.robot_state_publisher;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs kdl_parser orocos_kdl_vendor rcl_interfaces rclcpp rclcpp_components sensor_msgs std_msgs tf2_ros urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
