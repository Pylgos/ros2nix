{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcpputils,
  rcutils,
  rosbag2_cpp,
  rosbag2_storage,
  rosbag2_test_common,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_compression = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "23c5aad6a7beded26ab43a8426632c8a823212af";
        hash = "sha256-1JgGYoKdgu+AEQaixGwDFLTOcxd/Bp8pRu1KA8mzmwQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_compression";
  version = "0.15.11-1";
  src = sources.rosbag2_compression;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcpputils rcutils rosbag2_cpp rosbag2_storage ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
