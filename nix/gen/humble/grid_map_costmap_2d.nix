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
        rev = "a302bf64183dc130fe669a18d24b89a99bb5b033";
        hash = "sha256-OPRvprjYEWWeTe6Af3vvYKTs6kPDe8bVg45wS6nGmrk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_costmap_2d";
  version = "2.0.0-1";
  src = sources.grid_map_costmap_2d;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs grid_map_cmake_helpers grid_map_core nav2_costmap_2d tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
