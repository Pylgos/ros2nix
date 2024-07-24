{
  ament_cmake,
  ament_cmake_gmock,
  angles,
  backward_ros,
  buildRosPackage,
  control_msgs,
  control_toolbox,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  hardware_interface,
  hardware_interface_testing,
  parameter_traits,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  ros2_control_test_assets,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    pid_controller = substituteSource {
      src = fetchgit {
        name = "pid_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "5d38a4f1d2c9983d5adf9701adec20d81405b913";
        hash = "sha256-qrLaA4Af7l83DJvr3uh8q8fZ+OeeBqyfTJ915DQYy5o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pid_controller";
  version = "4.9.0-1";
  src = sources.pid_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface parameter_traits pluginlib rclcpp rclcpp_lifecycle realtime_tools std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
