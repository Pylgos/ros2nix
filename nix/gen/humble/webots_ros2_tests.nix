{
  ament_copyright,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  python3Packages,
  rclpy,
  ros2bag,
  rosbag2_storage_default_plugins,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_ros,
  webots_ros2_driver,
  webots_ros2_epuck,
  webots_ros2_mavic,
  webots_ros2_tesla,
  webots_ros2_tiago,
  webots_ros2_turtlebot,
  webots_ros2_universal_robot,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    webots_ros2_tests = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tests-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "084a1f8e5a015890e216ab4f4686fde369ca4e10";
        hash = "sha256-jTfBsM17BQ20ktL0Q46ChDPYOVrniigyrwY5E0xLh54=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_tests";
  version = "2023.1.2-1";
  src = sources.webots_ros2_tests;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2bag rosbag2_storage_default_plugins webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
