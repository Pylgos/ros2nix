{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  control_msgs,
  control_toolbox,
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
  rclcpp_action,
  realtime_tools,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    gripper_controllers = substituteSource {
      src = fetchgit {
        name = "gripper_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "28f502f71f1fe5e9fe89197b692a7203a22544af";
        hash = "sha256-HfjhKulUGX4Iz5chuCy2YFBnecb5H2WPSWm0dp+IANw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gripper_controllers";
  version = "3.24.0-1";
  src = sources.gripper_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_action realtime_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
