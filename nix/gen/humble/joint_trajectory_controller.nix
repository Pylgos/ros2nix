{
  ament_cmake,
  ament_cmake_gmock,
  angles,
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
  rclcpp_lifecycle,
  realtime_tools,
  ros2_control_test_assets,
  rsl,
  substituteSource,
  tl_expected,
  trajectory_msgs,
}:
let
  sources = rec {
    joint_trajectory_controller = substituteSource {
      src = fetchgit {
        name = "joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "0b94bbe308e4b10353c41f5c6a4a4f7c5a6d56c8";
        hash = "sha256-quNWnNCqT5UuoLLkAtPM87qvEbysLwFDR1EFPU4G3xo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_trajectory_controller";
  version = "2.35.0-1";
  src = sources.joint_trajectory_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools rsl tl_expected trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
