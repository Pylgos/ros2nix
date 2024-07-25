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
        rev = "0cd7e391d655b192da015eb553d923d36f3a0dd4";
        hash = "sha256-kqAqJVu5we4Cxr4qiaixf+REELj4kE99YZtT6lPacL0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_trajectory_controller";
  version = "3.24.0-1";
  src = sources.joint_trajectory_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools rsl tl_expected trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
