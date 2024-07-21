{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing_ament_cmake,
  launch_testing_ros,
  pluginlib,
  rclcpp,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    diagnostic_aggregator = substituteSource {
      src = fetchgit {
        name = "diagnostic_aggregator-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "198d2c8af06bea61f9ce6dc639c6be7a8a7c4dfa";
        hash = "sha256-lL0FmSDCv1n/Bmio+ZpqtEyJWMS5hh/Z5zjsVjkgAWw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_aggregator";
  version = "3.1.2-3";
  src = sources.diagnostic_aggregator;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs pluginlib rclcpp rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
