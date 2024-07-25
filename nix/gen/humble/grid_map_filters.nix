{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_msgs,
  grid_map_ros,
  pluginlib,
  substituteSource,
  tbb,
}:
let
  sources = rec {
    grid_map_filters = substituteSource {
      src = fetchgit {
        name = "grid_map_filters-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "6d182651e54752bd7328e659b65d77a410b084f8";
        hash = "sha256-mbBzPfgfLKp1Bm8HXCZ012tMsPZzm05OBQ25VgDch0g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_filters";
  version = "2.0.0-1";
  src = sources.grid_map_filters;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ filters grid_map_cmake_helpers grid_map_core grid_map_msgs grid_map_ros pluginlib tbb ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
