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
  test_msgs,
}:
let
  sources = rec {
    rosbag2_compression = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "7ba4015478dc668f341863a0c04ccf25a7a42d12";
        hash = "sha256-B3ANlmGL9HtmMe1pd7DoPCDNgXw0LEv9S30x692JfLI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_compression";
  version = "0.22.6-1";
  src = sources.rosbag2_compression;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcpputils rcutils rosbag2_cpp rosbag2_storage ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
