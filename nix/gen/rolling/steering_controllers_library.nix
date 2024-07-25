{
  ackermann_msgs,
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  control_msgs,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  geometry_msgs,
  hardware_interface,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rcpputils,
  realtime_tools,
  ros2_control_test_assets,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_msgs,
}:
let
  sources = rec {
    steering_controllers_library = substituteSource {
      src = fetchgit {
        name = "steering_controllers_library-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "4bf3cd3cd0b68b52158a6afbf3d6e86c85fc197c";
        hash = "sha256-4uc3ool8wE8qgUct6afwrYytfET7MTvG+211YbY3LE4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "steering_controllers_library";
  version = "4.10.0-1";
  src = sources.steering_controllers_library;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ackermann_msgs backward_ros control_msgs controller_interface generate_parameter_library geometry_msgs hardware_interface nav_msgs pluginlib rclcpp rclcpp_lifecycle rcpputils realtime_tools std_srvs tf2 tf2_geometry_msgs tf2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
