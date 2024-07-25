{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rmf_building_map_msgs,
  rmf_door_msgs,
  rmf_lift_msgs,
  rmf_visualization_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_visualization_building_systems = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_building_systems-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "918e7d4fb4cbbe3164a650c92062211f656d1e98";
        hash = "sha256-x066k5HAgrp9SVixua04l+g8sEiymW+es0bR+jQo2zs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_building_systems";
  version = "2.1.2-1";
  src = sources.rmf_visualization_building_systems;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rmf_building_map_msgs rmf_door_msgs rmf_lift_msgs rmf_visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
