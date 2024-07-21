{
  ament_cmake,
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  backward_ros,
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
        rev = "e954912b45d187dcfe3efa3cb0d4b7182d34996b";
        hash = "sha256-oQ0/oL7OkU5P/UTAStvoPh/dF525gW4Idrj15egR9rw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_fleet_adapter";
  version = "2.7.2-1";
  src = sources.rmf_fleet_adapter;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ eigen libyamlcpp ];
  propagatedBuildInputs = [ backward_ros nlohmann_json nlohmann_json_schema_validator_vendor rclcpp rclcpp_components rmf_api_msgs rmf_battery rmf_building_map_msgs rmf_dispenser_msgs rmf_door_msgs rmf_fleet_msgs rmf_ingestor_msgs rmf_lift_msgs rmf_task rmf_task_msgs rmf_task_ros2 rmf_task_sequence rmf_traffic rmf_traffic_ros2 rmf_utils rmf_websocket std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}