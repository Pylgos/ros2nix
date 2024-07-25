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
  octomap,
  substituteSource,
}:
let
  sources = rec {
    grid_map_octomap = substituteSource {
      src = fetchgit {
        name = "grid_map_octomap-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "5d6886f8d963ca8b6b5350bd83ef9cb220a26f72";
        hash = "sha256-kikULsPmzxcFpvDESyDMiO+V9YIbg+cpCMyYKYbyTGs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_octomap";
  version = "2.1.0-1";
  src = sources.grid_map_octomap;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core octomap ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
