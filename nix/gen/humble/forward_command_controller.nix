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
        rev = "c1483e2c99e21bbe998264a4362b56eb90693d54";
        hash = "sha256-MH3/V8knHlXwhSroZGgEABLOFProXq/QXMLLmvWOCxQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "forward_command_controller";
  version = "2.35.0-1";
  src = sources.forward_command_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
