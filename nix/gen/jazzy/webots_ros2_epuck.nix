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
  nav_msgs,
  python3Packages,
  rclpy,
  robot_state_publisher,
  rviz2,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros,
  webots_ros2_control,
  webots_ros2_driver,
  webots_ros2_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    webots_ros2_epuck = substituteSource {
      src = fetchgit {
        name = "webots_ros2_epuck-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "5a65e4b33212b91932b1524d953eadbc489e4542";
        hash = "sha256-o97nQuIC2/e/wHlOabMJL6n2jqaQRDyW4R86jzKNuWQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_epuck";
  version = "2023.1.2-4";
  src = sources.webots_ros2_epuck;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces controller_manager diff_drive_controller geometry_msgs joint_state_broadcaster nav_msgs rclpy robot_state_publisher rviz2 sensor_msgs std_msgs tf2_ros webots_ros2_control webots_ros2_driver webots_ros2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
