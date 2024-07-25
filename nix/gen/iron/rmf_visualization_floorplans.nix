{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  opencv,
  rclcpp,
  rclcpp_components,
  rmf_building_map_msgs,
  rmf_utils,
  rmf_visualization_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_visualization_floorplans = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_floorplans-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "dbc0b720c7efb006d1656879759aadd1b463fadc";
        hash = "sha256-xZscGdw192QeWhQZL4PqYxgVtVd9CMernpohpOlgkVo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_floorplans";
  version = "2.1.2-1";
  src = sources.rmf_visualization_floorplans;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs nav_msgs opencv rclcpp rclcpp_components rmf_building_map_msgs rmf_visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
