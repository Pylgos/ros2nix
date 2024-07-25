{
  ament_cmake,
  ament_cmake_gen_version_h,
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
        rev = "2eee87b59097bdabf52fccb8e0399b30a424a3a0";
        hash = "sha256-bQMB4rNuH6OmcOD1Ja0E8PE+gSYjYr95h+numRm0R1o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_manager";
  version = "4.12.0-1";
  src = sources.controller_manager;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ament_cmake_python ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp backward_ros controller_interface controller_manager_msgs diagnostic_updater hardware_interface launch_ros pluginlib rclcpp rcpputils realtime_tools ros2_control_test_assets ros2param ros2run std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
