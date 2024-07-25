{
  ament_cmake,
  ament_cmake_gmock,
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
    tricycle_steering_controller = substituteSource {
      src = fetchgit {
        name = "tricycle_steering_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "627988f4037f0fcf0abbc15babe25cd88507086b";
        hash = "sha256-8ChyTm46lhrqTCdKK3lo9Vohmm6KOJ0s/xPxVQGHOuA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tricycle_steering_controller";
  version = "2.35.0-1";
  src = sources.tricycle_steering_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle std_srvs steering_controllers_library ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
