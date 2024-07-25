{
  ament_cmake_core,
  ament_cmake_libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_dependencies = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_dependencies-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "d63aeb5b53c93353df4b1711a52f2dcefc3cf73f";
        hash = "sha256-vXT7T+iJGFeyJU2yq5fGjBBn0Hyjb26aos7Q8Vi6/mU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_dependencies";
  version = "1.3.9-1";
  src = sources.ament_cmake_export_dependencies;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_libraries ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
