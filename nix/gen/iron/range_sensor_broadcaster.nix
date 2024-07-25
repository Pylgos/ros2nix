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
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    range_sensor_broadcaster = substituteSource {
      src = fetchgit {
        name = "range_sensor_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "90863e219cd5fa82d1ea1c074beffd5c82007760";
        hash = "sha256-ynsevb6yh5gv4ckuVyUvIFBtwka7cDDcLgPozrVFa+I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "range_sensor_broadcaster";
  version = "3.24.0-1";
  src = sources.range_sensor_broadcaster;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
