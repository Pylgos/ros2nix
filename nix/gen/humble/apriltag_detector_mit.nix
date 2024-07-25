{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  apriltag_detector,
  apriltag_mit,
  apriltag_msgs,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  pluginlib,
  rclcpp,
  rclcpp_components,
  ros_environment,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    apriltag_detector_mit = substituteSource {
      src = fetchgit {
        name = "apriltag_detector_mit-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "e41c4745aac52df5dd8cff88ce85b37a0acb0141";
        hash = "sha256-FtYpLg3Vr4DUOb0dmxmo6Jw8AGzB4xOI7B0h+5axg6M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_detector_mit";
  version = "2.1.0-1";
  src = sources.apriltag_detector_mit;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag_detector apriltag_mit apriltag_msgs cv_bridge image_transport pluginlib rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
