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
    bicycle_steering_controller = substituteSource {
      src = fetchgit {
        name = "bicycle_steering_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "7c805d87a714bb871d2d1beda3d3050e444a0196";
        hash = "sha256-mMSVT9+XM+6yWHVkg3UOJzKFfCDA5eeaI1P7NJ68pg8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bicycle_steering_controller";
  version = "2.35.0-1";
  src = sources.bicycle_steering_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle std_srvs steering_controllers_library ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
