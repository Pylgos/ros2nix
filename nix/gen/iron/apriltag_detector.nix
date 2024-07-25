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
        rev = "6964664f61dbd6e43bdad8f8f47967dcf582ee27";
        hash = "sha256-2772ZVuZkwegI+cVwcRHct8SH6bIx72Xrh8alPT2PHE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_detector";
  version = "2.2.0-1";
  src = sources.apriltag_detector;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag_msgs pluginlib rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
