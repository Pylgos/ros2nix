{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  builtin_interfaces,
  control_msgs,
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
  rcutils,
  realtime_tools,
  ros2_control_test_assets,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    joint_state_broadcaster = substituteSource {
      src = fetchgit {
        name = "joint_state_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "8c590d78e506b4ad8568d2160ba0dea09daf8cb0";
        hash = "sha256-K5T9vwZiqVieNsCwVOJDg5e8sgjRsRfnzeYat5utapE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_state_broadcaster";
  version = "4.10.0-1";
  src = sources.joint_state_broadcaster;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros builtin_interfaces control_msgs controller_interface generate_parameter_library pluginlib rclcpp_lifecycle rcutils realtime_tools sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
