{
  ament_copyright,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
  webots_ros2_control,
  webots_ros2_driver,
  webots_ros2_epuck,
  webots_ros2_importer,
  webots_ros2_mavic,
  webots_ros2_msgs,
  webots_ros2_tesla,
  webots_ros2_tests,
  webots_ros2_tiago,
  webots_ros2_turtlebot,
  webots_ros2_universal_robot,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    webots_ros2 = substituteSource {
      src = fetchgit {
        name = "webots_ros2-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "1d9c274370902a11b08599cf967b4b300e432f49";
        hash = "sha256-FnL4qXJW0C5/hn98Yjy6D2xq3GL41+uGs/kOJsRDfDo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2";
  version = "2023.1.2-1";
  src = sources.webots_ros2;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclpy std_msgs webots_ros2_control webots_ros2_driver webots_ros2_epuck webots_ros2_importer webots_ros2_mavic webots_ros2_msgs webots_ros2_tesla webots_ros2_tiago webots_ros2_turtlebot webots_ros2_universal_robot ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
