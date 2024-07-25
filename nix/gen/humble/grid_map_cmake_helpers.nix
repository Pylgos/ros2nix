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
        rev = "f1f8c547f0b1cb9aeb50e8b9b43168b76d45b208";
        hash = "sha256-LjphUxeZf8+o/84nll1opLo1LAylfOeaIe2HCwIf2jQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_cmake_helpers";
  version = "2.0.0-1";
  src = sources.grid_map_cmake_helpers;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
