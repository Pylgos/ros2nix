{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  camera_calibration_parsers,
  ceres-solver,
  control_msgs,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometric_shapes,
  geometry_msgs,
  gflags,
  kdl_parser,
  launch,
  launch_ros,
  launch_testing,
  libyamlcpp,
  moveit_msgs,
  nav_msgs,
  orocos-kdl,
  pluginlib,
  protobuf,
  python3Packages,
  rclcpp,
  rclcpp_action,
  robot_calibration_msgs,
  rosbag2_cpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  suitesparse,
  tf2_geometry_msgs,
  tf2_ros,
  tinyxml-2,
  tinyxml2_vendor,
  visualization_msgs,
}:
let
  sources = rec {
    robot_calibration = substituteSource {
      src = fetchgit {
        name = "robot_calibration-source";
        url = "https://github.com/ros2-gbp/robot_calibration-release.git";
        rev = "ca2ad2707aee2162bf2f9ea94434a36249e31f2a";
        hash = "sha256-bOFqye7NuLfpg3rWijI+vFtq1CmMKg/MnrQZFUkEj48=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_calibration";
  version = "0.8.1-1";
  src = sources.robot_calibration;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers ceres-solver control_msgs cv_bridge eigen geometric_shapes geometry_msgs gflags kdl_parser libyamlcpp moveit_msgs nav_msgs orocos-kdl pluginlib protobuf python3Packages.boost rclcpp rclcpp_action robot_calibration_msgs rosbag2_cpp sensor_msgs std_msgs suitesparse tf2_geometry_msgs tf2_ros tinyxml-2 tinyxml2_vendor visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
