{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_gmock,
  ament_cmake_python,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap_vendor,
  pluginlib,
  rcutils,
  rosbag2_storage,
  rosbag2_test_common,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_storage_mcap = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_mcap-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "7dd1abb79c7ea487a4c5fba5dcdcfe1e3f043991";
        hash = "sha256-x/FgHxrOo2qoxUTHo1aU4yAEk8kPvpbgG849vhaBclw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_mcap";
  version = "0.22.6-1";
  src = sources.rosbag2_storage_mcap;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mcap_vendor pluginlib rcutils rosbag2_storage ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
