{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_test_common = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_common-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "c9c8a794ee96377d87b08cfdfa417a2992085896";
        hash = "sha256-4OFQnissLCs9gonxRBE8llVC2n+PCCas2rFBAdJchc8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_test_common";
  version = "0.15.11-1";
  src = sources.rosbag2_test_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
