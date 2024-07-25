{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_core,
  pcl,
  substituteSource,
}:
let
  sources = rec {
    grid_map_sdf = substituteSource {
      src = fetchgit {
        name = "grid_map_sdf-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "6a66e2fc47ea0b490802ea3ae5cec1bb61f9ac5d";
        hash = "sha256-guBbaRdV82jw91dVwB+0cg6HxO5zChFpjNp43kV+MYQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_sdf";
  version = "2.1.0-1";
  src = sources.grid_map_sdf;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core pcl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
