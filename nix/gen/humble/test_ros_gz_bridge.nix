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
        rev = "1ba3e7a351de28993b935f2f405faced23607f04";
        hash = "sha256-YWsJFwg8HymbLPeFTMBeCZ4FFbLdXlocD0sPUHvIj+c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_ros_gz_bridge";
  version = "0.244.15-1";
  src = sources.test_ros_gz_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_bridge ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
