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
        rev = "48610b84c69ee3d8014237bc8c3f54d2a1a5d80c";
        hash = "sha256-EyciYfWdhoKgAqi1PnkkYJC0pAoTQj0Ps/VAcFy2iIw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diff_drive_controller";
  version = "4.10.0-1";
  src = sources.diff_drive_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_interface generate_parameter_library geometry_msgs hardware_interface nav_msgs pluginlib rclcpp rclcpp_lifecycle rcpputils realtime_tools tf2 tf2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
