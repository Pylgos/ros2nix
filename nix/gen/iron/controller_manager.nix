{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_python,
  ament_index_cpp,
  backward_ros,
  buildRosPackage,
  controller_interface,
  controller_manager_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  hardware_interface_testing,
  launch,
  launch_ros,
  pluginlib,
  rclcpp,
  rcpputils,
  realtime_tools,
  ros2_control_test_assets,
  ros2param,
  ros2run,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    controller_manager = substituteSource {
      src = fetchgit {
        name = "controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "55e018891091c5bb1ed9677570e2c2eb0e0d1ed0";
        hash = "sha256-Fj+XxTHvGvQS1SHDWOfN86SU6JvneGpsFAXLr5R0Be4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_manager";
  version = "3.25.0-1";
  src = sources.controller_manager;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_index_cpp launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_interface controller_manager_msgs diagnostic_updater hardware_interface launch_ros pluginlib rclcpp rcpputils realtime_tools ros2_control_test_assets ros2param ros2run std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
