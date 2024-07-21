{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  control_msgs,
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
  ros2_control_test_assets,
  std_srvs,
  steering_controllers_library,
  substituteSource,
}:
let
  sources = rec {
    ackermann_steering_controller = substituteSource {
      src = fetchgit {
        name = "ackermann_steering_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "d45d0c072587d83ee9f5dc026d2965b7b40b8cac";
        hash = "sha256-D8Z00WbMVHY9mEctgfZ9rT4D+0nk4eP3QenvQ2vsZPQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ackermann_steering_controller";
  version = "4.9.0-1";
  src = sources.ackermann_steering_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ generate_parameter_library ];
  propagatedBuildInputs = [ backward_ros control_msgs controller_interface hardware_interface pluginlib rclcpp rclcpp_lifecycle std_srvs steering_controllers_library ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
