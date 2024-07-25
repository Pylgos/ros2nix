{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward_command_controller,
  hardware_interface,
  hardware_interface_testing,
  pluginlib,
  rclcpp,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    velocity_controllers = substituteSource {
      src = fetchgit {
        name = "velocity_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "13319234a0f421a3257440ff9154a9d57d5aa912";
        hash = "sha256-RZaAXmF8Qj3jOsZevYX0kItl5CHIgsiA+NoEOdhJwpQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velocity_controllers";
  version = "2.35.0-1";
  src = sources.velocity_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros forward_command_controller pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
