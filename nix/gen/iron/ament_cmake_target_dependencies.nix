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
        rev = "5c9481e4edae414b44f4b4ac36846db3a29ffdf9";
        hash = "sha256-po/AwGhwuPZ4d+on6J5APoCORLgNwsrRPo0Ck69mSOA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_target_dependencies";
  version = "2.0.5-1";
  src = sources.ament_cmake_target_dependencies;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_include_directories ament_cmake_libraries ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_include_directories ament_cmake_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
