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
        rev = "1aeefb5f0c610637205f030a7391aab825f78b21";
        hash = "sha256-LWdA9/nrdNOiNbQB7eoia1bDkPfOeAjchWCuYmuiV/M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_detector_umich";
  version = "2.2.0-1";
  src = sources.apriltag_detector_umich;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag apriltag_detector apriltag_msgs cv_bridge image_transport pluginlib rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
