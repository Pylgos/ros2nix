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
        rev = "ad627d8748c91d9ec0b139edc9a0a301acd406e7";
        hash = "sha256-Byuc4PRLZgZWZiUj8xXt9xOfU2dhIxKdGeZA4QgGaXs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velocity_controllers";
  version = "3.24.0-1";
  src = sources.velocity_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros forward_command_controller pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
