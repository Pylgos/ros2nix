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
        rev = "5e396777bbb91cfe5d1f688755818a0a1fa87266";
        hash = "sha256-wTMWmOxsyQHo1aviWDWHrOIIdwiHclfAdfY/sI9ihyU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_manager";
  version = "4.11.0-1";
  src = sources.controller_manager;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp backward_ros controller_interface controller_manager_msgs diagnostic_updater hardware_interface launch launch_ros pluginlib rclcpp rcpputils realtime_tools ros2_control_test_assets ros2param ros2run std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
