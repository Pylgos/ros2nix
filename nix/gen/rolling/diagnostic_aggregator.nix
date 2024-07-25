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
  launch_pytest,
  launch_testing_ament_cmake,
  launch_testing_ros,
  pluginlib,
  rcl_interfaces,
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
        rev = "e9698037223496271effb84aff0efa4ce892ca76";
        hash = "sha256-clgVU7F09858pjWPZm1xE6EcdZcc0xA4tnHKjUS/zcM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_aggregator";
  version = "4.3.0-1";
  src = sources.diagnostic_aggregator;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs pluginlib rcl_interfaces rclcpp rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
