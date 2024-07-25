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
        rev = "dbc88f5a17f5788a31e8c60f1909d32fd1899eca";
        hash = "sha256-uOEgK62J/eMdO+zI8DLoPxaOSQWo1zF0V0ecDBtCfP4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tricycle_steering_controller";
  version = "3.24.0-1";
  src = sources.tricycle_steering_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle std_srvs steering_controllers_library ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
