{
  ament_cmake,
  ament_cmake_cpplint,
  ament_cmake_gtest,
  angles,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  kdl_parser,
  nav_msgs,
  orocos-kdl,
  pluginlib,
  rclcpp,
  rclcpp_action,
  robot_controllers_interface,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  trajectory_msgs,
  urdf,
}:
let
  sources = rec {
    robot_controllers = substituteSource {
      src = fetchgit {
        name = "robot_controllers-source";
        url = "https://github.com/fetchrobotics-gbp/robot_controllers-ros2-release.git";
        rev = "d66b0d3775796b3b90f7af6689062931683ea73a";
        hash = "sha256-CW/MOZq5Lr+ookyxZHNH4xoBmG7I9gfRf+/28JicDNM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_controllers";
  version = "0.9.3-1";
  src = sources.robot_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles control_msgs geometry_msgs kdl_parser nav_msgs orocos-kdl pluginlib rclcpp rclcpp_action robot_controllers_interface sensor_msgs std_msgs tf2_geometry_msgs tf2_ros trajectory_msgs urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
