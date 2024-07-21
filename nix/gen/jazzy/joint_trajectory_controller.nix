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
  urdf,
}:
let
  sources = rec {
    joint_trajectory_controller = substituteSource {
      src = fetchgit {
        name = "joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "3cabe719ecea2c3620cf12b95cf5802f83ec6b32";
        hash = "sha256-HffwXlveNz//rs2kMN/rH1eOVOgoCwNJhY4w1W48E0o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_trajectory_controller";
  version = "4.9.0-1";
  src = sources.joint_trajectory_controller;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools rsl tl_expected trajectory_msgs urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
