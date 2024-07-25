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
        rev = "753a50f72d9bac50da33ca77b464a786b27f588b";
        hash = "sha256-SMwq2ekPtjgT5utYSheEKj+evr4JvfZunE3cs+vt1BY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_state_broadcaster";
  version = "2.35.0-1";
  src = sources.joint_state_broadcaster;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros builtin_interfaces control_msgs controller_interface generate_parameter_library pluginlib rclcpp_lifecycle rcutils realtime_tools sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
