{
  ament_cmake,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward_command_controller,
  joint_state_broadcaster,
  joint_state_publisher_gui,
  joint_trajectory_controller,
  robot_state_publisher,
  ros2_controllers_test_nodes,
  ros2controlcli,
  ros2launch,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    qb_device_bringup = substituteSource {
      src = fetchgit {
        name = "qb_device_bringup-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "c9ffc53b1a2f53f8e1a6b0ba29d7f3b094f470bf";
        hash = "sha256-7YFLO0SusvFz1TnD8KbWnJfwk0UM8kYmCZ7DS7COdpA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_device_bringup";
  version = "4.1.3-1";
  src = sources.qb_device_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager forward_command_controller joint_state_broadcaster joint_state_publisher_gui joint_trajectory_controller robot_state_publisher ros2_controllers_test_nodes ros2controlcli ros2launch rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
