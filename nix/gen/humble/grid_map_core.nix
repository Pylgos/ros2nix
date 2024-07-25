{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  substituteSource,
}:
let
  sources = rec {
    grid_map_core = substituteSource {
      src = fetchgit {
        name = "grid_map_core-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "273a92a5cb488aa723dd82352d011d4c8702a090";
        hash = "sha256-yTXyiyf/+xFeG+AzH7seDiCeMtlXiRKvaA4Z3Ewgi9g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_core";
  version = "2.0.0-1";
  src = sources.grid_map_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen grid_map_cmake_helpers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
