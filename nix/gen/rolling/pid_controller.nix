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
        rev = "f91f12db0148e264dcce80c8e33ceeaeb1b50673";
        hash = "sha256-Fslyfl5VAfUq4apMizHp2kMNj1vl40P8IqZxkv1O9b0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pid_controller";
  version = "4.10.0-1";
  src = sources.pid_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface parameter_traits pluginlib rclcpp rclcpp_lifecycle realtime_tools std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
