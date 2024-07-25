{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosbag2_storage_mcap,
  rosbag2_storage_sqlite3,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_storage_default_plugins = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_default_plugins-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2f2207e821e959b411d5043b9391bcab27aae5c4";
        hash = "sha256-emy2+R5ate6SYrEn/REj2nVXjPNnwDo0x6NuBOcSm6w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_default_plugins";
  version = "0.22.6-1";
  src = sources.rosbag2_storage_default_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosbag2_storage_mcap rosbag2_storage_sqlite3 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
