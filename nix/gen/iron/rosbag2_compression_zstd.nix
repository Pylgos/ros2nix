{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rclcpp,
  rcpputils,
  rcutils,
  rosbag2_compression,
  rosbag2_test_common,
  substituteSource,
  zstd_vendor,
}:
let
  sources = rec {
    rosbag2_compression_zstd = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression_zstd-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "73ece2b4d780fb0de2d96e2e437a0b1d1da0bdcf";
        hash = "sha256-KGWaVM18EBxPYMnPnFNe2UIzECeNPrDiAKK1aTh60RI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_compression_zstd";
  version = "0.22.6-1";
  src = sources.rosbag2_compression_zstd;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rcpputils rcutils rosbag2_compression zstd_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
