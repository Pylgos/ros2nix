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
    ackermann_steering_controller = substituteSource {
      src = fetchgit {
        name = "ackermann_steering_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "ca1993fed8ab0790b86e9a37957f7f33017369cb";
        hash = "sha256-5kLzAAX78DzSBDUCgJUp8EbsXq/0/8lhymWgM72YubI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ackermann_steering_controller";
  version = "2.35.0-1";
  src = sources.ackermann_steering_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle std_srvs steering_controllers_library ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
