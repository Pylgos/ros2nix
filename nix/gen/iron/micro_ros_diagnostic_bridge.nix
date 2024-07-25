{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  micro_ros_diagnostic_msgs,
  osrf_testing_tools_cpp,
  rclcpp,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    micro_ros_diagnostic_bridge = substituteSource {
      src = fetchgit {
        name = "micro_ros_diagnostic_bridge-source";
        url = "https://github.com/ros2-gbp/micro_ros_diagnostics-release.git";
        rev = "c043be4367a199d4e028b2cb18adfd6d392932d3";
        hash = "sha256-mBsQdSKOPVQJVBc/FxvaxH5NOtAJy3M+bYciq7eHg+c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "micro_ros_diagnostic_bridge";
  version = "0.3.0-5";
  src = sources.micro_ros_diagnostic_bridge;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs micro_ros_diagnostic_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
