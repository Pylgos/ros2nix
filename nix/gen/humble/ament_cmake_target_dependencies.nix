{
  ament_cmake_core,
  ament_cmake_include_directories,
  ament_cmake_libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_target_dependencies = substituteSource {
      src = fetchgit {
        name = "ament_cmake_target_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "f0aadb6fef8d835b5d5173b573fa51f548a6b809";
        hash = "sha256-3LkCoRCr89iyux8N2xoIlr+UyZJC2k6QTcCSM3+NjQE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_target_dependencies";
  version = "1.3.9-1";
  src = sources.ament_cmake_target_dependencies;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_include_directories ament_cmake_libraries ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_include_directories ament_cmake_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
