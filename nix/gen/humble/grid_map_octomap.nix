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
        rev = "c079e3ef5ca99c0814990afbc569128c079c7f1d";
        hash = "sha256-Io326xBR0PlgXK5Kj/l3wJ/YfzvHx6/G1sL1wDijWOE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_octomap";
  version = "2.0.0-1";
  src = sources.grid_map_octomap;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core octomap ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
