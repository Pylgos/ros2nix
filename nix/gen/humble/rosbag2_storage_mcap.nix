{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_gmock,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap_vendor,
  pluginlib,
  rcpputils,
  rcutils,
  rosbag2_storage,
  rosbag2_storage_mcap_testdata,
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
        rev = "dbc663025653f11e80d2e2ec9d4e9036663506f6";
        hash = "sha256-BIv1pD2kOADq9WmeiHVxWRBiaCP/C3ihDZLaDjV90ew=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_mcap";
  version = "0.15.11-1";
  src = sources.rosbag2_storage_mcap;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mcap_vendor pluginlib rcutils rosbag2_storage ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
