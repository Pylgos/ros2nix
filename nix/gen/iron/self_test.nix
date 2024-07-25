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
        rev = "646a261ecc8b271f2f7e780655fc36c82a874a2a";
        hash = "sha256-WBE4IXns7nK3b08bqxzd3iKBB3D7liezRgDRU1jcYe0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "self_test";
  version = "4.1.0-1";
  src = sources.self_test;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
