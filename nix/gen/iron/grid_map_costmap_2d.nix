{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  grid_map_cmake_helpers,
  grid_map_core,
  nav2_costmap_2d,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    grid_map_costmap_2d = substituteSource {
      src = fetchgit {
        name = "grid_map_costmap_2d-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "6a9f7cc7728f22d003d18d425bf7c520b7f7937c";
        hash = "sha256-WbKYQTGisHgtu+yQjdlLYcgt/HDT3pL2W5fblrVjG4k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_costmap_2d";
  version = "2.1.0-1";
  src = sources.grid_map_costmap_2d;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs grid_map_cmake_helpers grid_map_core nav2_costmap_2d tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
