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
        rev = "dd29c3d31bd5ae549e1f7e3a6bd6f97372bf071b";
        hash = "sha256-OOMc2/rb88r5HnkCPYooybBodmbYqlVKV36oEuOYhHI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ackermann_steering_controller";
  version = "4.10.0-1";
  src = sources.ackermann_steering_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros control_msgs controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle std_srvs steering_controllers_library ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
