{
  ament_cmake,
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libyamlcpp,
  nlohmann_json,
  nlohmann_json_schema_validator_vendor,
  rclcpp,
  rclcpp_components,
  rmf_api_msgs,
  rmf_battery,
  rmf_building_map_msgs,
  rmf_dispenser_msgs,
  rmf_door_msgs,
  rmf_fleet_msgs,
  rmf_ingestor_msgs,
  rmf_lift_msgs,
  rmf_task,
  rmf_task_msgs,
  rmf_task_ros2,
  rmf_task_sequence,
  rmf_traffic,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_websocket,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_fleet_adapter = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "8481090c262d253b72a74ba34a54ba1160773aef";
        hash = "sha256-e8j/S8b4WRP1DzIWoGznVqSLrZRjXnFzYF5dc9NKkgo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_fleet_adapter";
  version = "2.2.5-1";
  src = sources.rmf_fleet_adapter;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libyamlcpp nlohmann_json nlohmann_json_schema_validator_vendor rclcpp rclcpp_components rmf_api_msgs rmf_battery rmf_building_map_msgs rmf_dispenser_msgs rmf_door_msgs rmf_fleet_msgs rmf_ingestor_msgs rmf_lift_msgs rmf_task rmf_task_msgs rmf_task_ros2 rmf_task_sequence rmf_traffic rmf_traffic_ros2 rmf_utils rmf_websocket std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
