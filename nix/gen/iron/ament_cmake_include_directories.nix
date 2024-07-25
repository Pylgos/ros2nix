{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_include_directories = substituteSource {
      src = fetchgit {
        name = "ament_cmake_include_directories-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "c4803f7589346dd46551d54ba5204f91d861ada1";
        hash = "sha256-an2K+jLW8hwcr37Ft3zcO2p5xoeLyOQjdiyn9HaKZpM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_include_directories";
  version = "2.0.5-1";
  src = sources.ament_cmake_include_directories;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
