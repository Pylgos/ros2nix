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
        rev = "6c5df57246d87d61fae25505cf3025fb3b3cad30";
        hash = "sha256-+arsB0wQrxtMlsWZCl/B/rD+DjY3MoHR4vR7DHQKDfE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_compression_zstd";
  version = "0.15.11-1";
  src = sources.rosbag2_compression_zstd;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rcpputils rcutils rosbag2_compression zstd_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
