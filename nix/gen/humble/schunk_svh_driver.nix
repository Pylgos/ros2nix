{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  joint_state_broadcaster,
  joint_trajectory_controller,
  launch,
  launch_ros,
  pluginlib,
  rclcpp,
  ros2launch,
  schunk_svh_description,
  schunk_svh_library,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    schunk_svh_driver = substituteSource {
      src = fetchgit {
        name = "schunk_svh_driver-source";
        url = "https://github.com/ros2-gbp/schunk_svh_ros_driver-release.git";
        rev = "ba9f7ace87db26e192455618f09788bbc05d4d63";
        hash = "sha256-0buDyivyqoRlMN5xkODA39xheWF5+ygyRutVPubIXWc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "schunk_svh_driver";
  version = "2.1.1-1";
  src = sources.schunk_svh_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager hardware_interface joint_state_broadcaster joint_trajectory_controller launch_ros pluginlib rclcpp ros2launch schunk_svh_description schunk_svh_library xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
