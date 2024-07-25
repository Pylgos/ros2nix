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
    effort_controllers = substituteSource {
      src = fetchgit {
        name = "effort_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "c156099fef7fcf41ed8f212b219509bb40c54c9c";
        hash = "sha256-Zbyf1yTMmqIJsGaH6NYd64nr3uiFon0duZlrO/dQjIM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "effort_controllers";
  version = "3.24.0-1";
  src = sources.effort_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros forward_command_controller pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
