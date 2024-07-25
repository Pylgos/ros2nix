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
        rev = "39a2729603983edcf706d5757e6179060bc096a2";
        hash = "sha256-92Wx/C1IJfMfXhcm3Q6/ONzC1tSLPcfMEEkPQ9ZkIPo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "force_torque_sensor_broadcaster";
  version = "4.10.0-1";
  src = sources.force_torque_sensor_broadcaster;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_interface generate_parameter_library geometry_msgs hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
