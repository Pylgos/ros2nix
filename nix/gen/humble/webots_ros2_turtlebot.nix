{
  ament_copyright,
  buildRosPackage,
  builtin_interfaces,
  controller_manager,
  diff_drive_controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_broadcaster,
  python3Packages,
  rclpy,
  robot_state_publisher,
  rviz2,
  substituteSource,
  tf2_ros,
  webots_ros2_control,
  webots_ros2_driver,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    webots_ros2_turtlebot = substituteSource {
      src = fetchgit {
        name = "webots_ros2_turtlebot-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "dc19aa3dbb75e1e1dd05cfb2f9ded45148559a7d";
        hash = "sha256-2TxF0QtrOF4IKuagK9U1DtFWGg2NtFAyNg+eBtH3pBk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_turtlebot";
  version = "2023.1.2-1";
  src = sources.webots_ros2_turtlebot;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces controller_manager diff_drive_controller joint_state_broadcaster rclpy robot_state_publisher rviz2 tf2_ros webots_ros2_control webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
