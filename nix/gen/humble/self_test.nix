{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    self_test = substituteSource {
      src = fetchgit {
        name = "self_test-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "dfeb1458012910ae94a99aa1dcbdd3f2e0033995";
        hash = "sha256-EE8Y5fn3qzO2fEWN6PUuD04gpUMmiGXokY9uuyGu04U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "self_test";
  version = "4.0.0-1";
  src = sources.self_test;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
