{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  hardware_interface,
  hardware_interface_testing,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  ros2_control_test_assets,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    forward_command_controller = substituteSource {
      src = fetchgit {
        name = "forward_command_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "99edceeb459e4dbe4eea7d0496f8cef9fcd0b96c";
        hash = "sha256-c3vDS67N+oqul2twdDhOYlIJxPVTfhpVFM1l+NR+o9E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "forward_command_controller";
  version = "4.10.0-1";
  src = sources.forward_command_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}