{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_costmap_2d,
  grid_map_cv,
  grid_map_demos,
  grid_map_filters,
  grid_map_loader,
  grid_map_msgs,
  grid_map_octomap,
  grid_map_pcl,
  grid_map_ros,
  grid_map_rviz_plugin,
  grid_map_sdf,
  grid_map_visualization,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    grid_map = substituteSource {
      src = fetchgit {
        name = "grid_map-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "9c1ea34ea38a73c47279277bd6cedbbb32893497";
        hash = "sha256-etdEiwlr/Oed2WodG3C12icwbPJ13cyTxUbKIF4MkNk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map";
  version = "2.0.0-1";
  src = sources.grid_map;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core grid_map_costmap_2d grid_map_cv grid_map_demos grid_map_filters grid_map_loader grid_map_msgs grid_map_octomap grid_map_pcl grid_map_ros grid_map_rviz_plugin grid_map_sdf grid_map_visualization ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
