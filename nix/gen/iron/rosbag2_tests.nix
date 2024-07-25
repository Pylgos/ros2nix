{
  ament_cmake,
  ament_cmake_gmock,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcpputils,
  ros2bag,
  rosbag2_compression,
  rosbag2_compression_zstd,
  rosbag2_cpp,
  rosbag2_interfaces,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  std_msgs,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rosbag2_tests = substituteSource {
      src = fetchgit {
        name = "rosbag2_tests-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "96941de119816c2e3ffb6795fd7e1636ed073875";
        hash = "sha256-rNBmnmtEI2unSyMn1plQTnYbsf251K3fZpyYZLndhkc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_tests";
  version = "0.22.6-1";
  src = sources.rosbag2_tests;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
