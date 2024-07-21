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
    position_controllers = substituteSource {
      src = fetchgit {
        name = "position_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "a5848134abd80f19f93359d03f38c141aad00084";
        hash = "sha256-oLSMmBT54HtRsWaqnyEneZNAecURg4sjZB9DB6aIfvw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "position_controllers";
  version = "4.9.0-1";
  src = sources.position_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros forward_command_controller pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
