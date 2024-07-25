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
        rev = "c67e8c90dcaaa85cb0a20054afcba42aff5f520e";
        hash = "sha256-A4PpQNnFut/qtyEH3dl/HHjHTo0lVr6+9BJik82Wov8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_core";
  version = "2.1.0-1";
  src = sources.grid_map_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen grid_map_cmake_helpers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
