{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2bag,
  rosbag2_compression,
  rosbag2_compression_zstd,
  rosbag2_cpp,
  rosbag2_py,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  rosbag2_tests,
  rosbag2_transport,
  shared_queues_vendor,
  sqlite3_vendor,
  substituteSource,
}:
let
  sources = rec {
    rosbag2 = substituteSource {
      src = fetchgit {
        name = "rosbag2-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "873305244faf09ce85e89c17c65cc90c76c814bb";
        hash = "sha256-ycM0+ezz9z5lGP12DyAAeXfytdCPUIDySC2GL0Dv3G4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2";
  version = "0.15.11-1";
  src = sources.rosbag2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2bag rosbag2_compression rosbag2_compression_zstd rosbag2_cpp rosbag2_py rosbag2_storage rosbag2_storage_default_plugins rosbag2_transport shared_queues_vendor sqlite3_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
