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
        rev = "ae47043e4cdb28dd714a1f03fc450159867b8b9e";
        hash = "sha256-wunPoLR+47jotJmPsuj0nTUzOZCY3nEEHj8ikRqBxjM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velocity_controllers";
  version = "4.10.0-1";
  src = sources.velocity_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros forward_command_controller pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
