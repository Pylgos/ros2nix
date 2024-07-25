{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  apriltag_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rclcpp,
  rclcpp_components,
  ros_environment,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    apriltag_detector = substituteSource {
      src = fetchgit {
        name = "apriltag_detector-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "799468c6634f2e0675803cfb853081d70c822bfe";
        hash = "sha256-fB8pdqVj3Oxmf7QZy0DLHeE23YH7dDZzV/Ms/vlMdd8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_detector";
  version = "2.1.0-1";
  src = sources.apriltag_detector;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag_msgs pluginlib rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
