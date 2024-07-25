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
        rev = "7ee1829816ac213fb6edb2caadd6e9eb5fac2da5";
        hash = "sha256-12zI7YDA3mLNsWZPLMdOHJqNQSrMQTu23G0reFrX8JU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_detector_mit";
  version = "2.2.0-1";
  src = sources.apriltag_detector_mit;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag_detector apriltag_mit apriltag_msgs cv_bridge image_transport pluginlib rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
