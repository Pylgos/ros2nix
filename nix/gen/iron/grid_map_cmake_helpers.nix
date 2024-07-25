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
    grid_map_cmake_helpers = substituteSource {
      src = fetchgit {
        name = "grid_map_cmake_helpers-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "efd99e1726c49cd59595d8ba8fc91d1fd9ee94fe";
        hash = "sha256-psAePa3Ee5RzFPbwwJxVUGGl31F/LVe8Mqq7OEFYOeM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_cmake_helpers";
  version = "2.1.0-1";
  src = sources.grid_map_cmake_helpers;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
