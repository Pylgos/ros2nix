{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  lifecycle_msgs,
  pluginlib,
  rclcpp_lifecycle,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    hardware_interface_testing = substituteSource {
      src = fetchgit {
        name = "hardware_interface_testing-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "8f4910ce32d5453486a338b01ea1e649a4afe509";
        hash = "sha256-u9o0AGeg1U8Y0Yr+yDvpUYNkhfJkPng1BXUaUJh836c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hardware_interface_testing";
  version = "3.25.0-1";
  src = sources.hardware_interface_testing;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs hardware_interface lifecycle_msgs pluginlib rclcpp_lifecycle ros2_control_test_assets ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
