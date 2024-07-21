{
  ackermann_msgs,
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  builtin_interfaces,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  geometry_msgs,
  hardware_interface,
  hardware_interface_testing,
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
  tf2_msgs,
}:
let
  sources = rec {
    tricycle_controller = substituteSource {
      src = fetchgit {
        name = "tricycle_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "16470622cb0f38e932e26b32187bc431f31f5ad7";
        hash = "sha256-MlZ2vPGF9WX8wE8W/A5at7wuWf9DIF/PcH6gGphKuNo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tricycle_controller";
  version = "4.9.0-1";
  src = sources.tricycle_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ generate_parameter_library ];
  propagatedBuildInputs = [ ackermann_msgs backward_ros builtin_interfaces controller_interface geometry_msgs hardware_interface nav_msgs pluginlib rclcpp rclcpp_lifecycle rcpputils realtime_tools std_srvs tf2 tf2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
