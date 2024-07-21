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
        rev = "d910bfc8c3f1600c9bd01084d6ef8ce3cb572b70";
        hash = "sha256-jFT+Y0sHUbO7gYOR7TSTbCzX3of8qBQnE0BW1Eq8piQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hardware_interface_testing";
  version = "4.11.0-1";
  src = sources.hardware_interface_testing;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs hardware_interface lifecycle_msgs pluginlib rclcpp_lifecycle ros2_control_test_assets ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
