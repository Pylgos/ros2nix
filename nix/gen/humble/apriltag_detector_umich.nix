{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  apriltag,
  apriltag_detector,
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
    apriltag_detector_umich = substituteSource {
      src = fetchgit {
        name = "apriltag_detector_umich-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "73beca1e0489c855c4a2025feb086bf84394067d";
        hash = "sha256-b4piZAplMCdNVGPwG+fuTg/nkfzAADg7UoDBviCM4lI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_detector_umich";
  version = "2.1.0-1";
  src = sources.apriltag_detector_umich;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag apriltag_detector apriltag_msgs cv_bridge image_transport pluginlib rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
