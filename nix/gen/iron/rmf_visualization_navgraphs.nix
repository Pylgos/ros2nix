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
        rev = "c441c972fc5286fc5b1353247f6983f551753bec";
        hash = "sha256-Z5wWRDb85T8G5PA1qSXZRYv+BazZpyD25MqheazOoYQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_navgraphs";
  version = "2.1.2-1";
  src = sources.rmf_visualization_navgraphs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp rclcpp_components rmf_building_map_msgs rmf_fleet_msgs rmf_traffic rmf_traffic_ros2 rmf_visualization_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
