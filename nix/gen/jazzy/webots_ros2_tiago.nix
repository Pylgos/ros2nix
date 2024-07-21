{
  ament_copyright,
  buildRosPackage,
  builtin_interfaces,
  controller_manager,
  diff_drive_controller,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  joint_state_broadcaster,
  python3Packages,
  rclpy,
  robot_state_publisher,
  rviz2,
  substituteSource,
  tf2_ros,
  webots_ros2_control,
  webots_ros2_driver,
}:
let
  sources = rec {
    webots_ros2_tiago = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tiago-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "5f79bc35578e158dbe043e3bdf1a3488f67847b1";
        hash = "sha256-/j9c90wP3C3iLTehu0VzCh+SlKfydx4Y/2SKhs0+HKg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_tiago";
  version = "2023.1.2-4";
  src = sources.webots_ros2_tiago;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces controller_manager diff_drive_controller geometry_msgs joint_state_broadcaster rclpy robot_state_publisher rviz2 tf2_ros webots_ros2_control webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}