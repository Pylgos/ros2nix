{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  ros_gz_bridge,
  substituteSource,
}:
let
  sources = rec {
    test_ros_gz_bridge = substituteSource {
      src = fetchgit {
        name = "test_ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "0ea3628d1b14aa6f5aaa60144763a2b3ad2f6294";
        hash = "sha256-9qlPb17VtXmRUQIeyb9QfGRjsrwG29AJnONWsZV0PBI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_ros_gz_bridge";
  version = "0.254.1-1";
  src = sources.test_ros_gz_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_bridge ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
