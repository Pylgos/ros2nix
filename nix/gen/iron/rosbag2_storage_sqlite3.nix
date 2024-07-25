{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rcpputils,
  rcutils,
  rosbag2_storage,
  rosbag2_test_common,
  sqlite3_vendor,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_storage_sqlite3 = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_sqlite3-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "faaed08d751464ca1084cf471bb87b19cf3d9aca";
        hash = "sha256-qAlMBKK8Hm8pGECYat9yYGh7JTeIevTW+MVM5fMUMq0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_sqlite3";
  version = "0.22.6-1";
  src = sources.rosbag2_storage_sqlite3;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rcpputils rcutils rosbag2_storage sqlite3_vendor yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
