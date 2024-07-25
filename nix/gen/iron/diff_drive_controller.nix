{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
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
  substituteSource,
  tf2,
  tf2_msgs,
}:
let
  sources = rec {
    diff_drive_controller = substituteSource {
      src = fetchgit {
        name = "diff_drive_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "83a1c755c7e4506c0b55e0eb7fa1f690ff72648f";
        hash = "sha256-FLZ8nb0VIjk2pQ+OpBXEmrOJMTHbSYqlvLWhcsx64mo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diff_drive_controller";
  version = "3.24.0-1";
  src = sources.diff_drive_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_interface generate_parameter_library geometry_msgs hardware_interface nav_msgs pluginlib rclcpp rclcpp_lifecycle rcpputils realtime_tools tf2 tf2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
