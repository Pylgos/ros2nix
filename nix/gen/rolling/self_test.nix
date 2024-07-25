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
        rev = "baa221523eafeaaac658094bb670993d92fcd410";
        hash = "sha256-u0nOy1SMZ/Cl5EQLDU4Qe+e/wrqmjT98ExpE9dlwIAc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "self_test";
  version = "4.3.0-1";
  src = sources.self_test;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
