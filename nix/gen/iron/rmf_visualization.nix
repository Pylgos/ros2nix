{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_xml,
  rmf_visualization_building_systems,
  rmf_visualization_fleet_states,
  rmf_visualization_floorplans,
  rmf_visualization_navgraphs,
  rmf_visualization_obstacles,
  rmf_visualization_rviz2_plugins,
  rmf_visualization_schedule,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_visualization = substituteSource {
      src = fetchgit {
        name = "rmf_visualization-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "1cbae3854e58ed77af4574182c58e8cb32fade5e";
        hash = "sha256-PFaTycbAqhe+ZDnpkYlTqsEC2oUUINQlWTVnj1sbils=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization";
  version = "2.1.2-1";
  src = sources.rmf_visualization;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch_xml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rmf_visualization_building_systems rmf_visualization_fleet_states rmf_visualization_floorplans rmf_visualization_navgraphs rmf_visualization_obstacles rmf_visualization_rviz2_plugins rmf_visualization_schedule ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
