{
  ackermann_msgs,
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
  geometry_msgs,
  hardware_interface,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rcpputils,
  realtime_tools,
  ros2_control_test_assets,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_msgs,
}:
let
  sources = rec {
    steering_controllers_library = substituteSource {
      src = fetchgit {
        name = "steering_controllers_library-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "1f64fa1513229d8fed40554d6d7fe77959ab543a";
        hash = "sha256-8g7V6ELx1UKigirqEk+aOzSM7uUmJNbs8EGuOB7t37I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "steering_controllers_library";
  version = "3.24.0-1";
  src = sources.steering_controllers_library;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ackermann_msgs backward_ros control_msgs controller_interface generate_parameter_library geometry_msgs hardware_interface nav_msgs pluginlib rclcpp rclcpp_lifecycle rcpputils realtime_tools std_srvs tf2 tf2_geometry_msgs tf2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
