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
  geometry_msgs,
  hardware_interface,
  hardware_interface_testing,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    force_torque_sensor_broadcaster = substituteSource {
      src = fetchgit {
        name = "force_torque_sensor_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "cf73251138846b152331ad9e73883de7946d22cd";
        hash = "sha256-bXs5xQRHspJTXCHj1MoD8AHjhSog5Iqeme9zKdRnIAc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "force_torque_sensor_broadcaster";
  version = "3.24.0-1";
  src = sources.force_torque_sensor_broadcaster;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_interface generate_parameter_library geometry_msgs hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
