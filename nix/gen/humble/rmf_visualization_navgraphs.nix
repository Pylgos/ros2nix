{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_components,
  rmf_building_map_msgs,
  rmf_fleet_msgs,
  rmf_traffic,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_visualization_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    rmf_visualization_navgraphs = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_navgraphs-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "429802229e42a75cd3be260ce8c4540fcde0fde8";
        hash = "sha256-7mYm6JyReRRdZJPM6btWgG66n6r6YpAWbSyLmoqmIyM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_navgraphs";
  version = "2.0.2-1";
  src = sources.rmf_visualization_navgraphs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp rclcpp_components rmf_building_map_msgs rmf_fleet_msgs rmf_traffic rmf_traffic_ros2 rmf_visualization_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
