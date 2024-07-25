{
  ament_cmake,
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  nlohmann_json,
  nlohmann_json_schema_validator_vendor,
  rclcpp,
  rmf_api_msgs,
  rmf_task_msgs,
  rmf_traffic,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_websocket,
  substituteSource,
}:
let
  sources = rec {
    rmf_task_ros2 = substituteSource {
      src = fetchgit {
        name = "rmf_task_ros2-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "2995e8ee5b65bb5d849989f231d5759ab64fcce0";
        hash = "sha256-p3/XY2o93PQKkH0YVuv2ZPp32GSwV2qJRem0R83VWK8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task_ros2";
  version = "2.2.5-1";
  src = sources.rmf_task_ros2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen nlohmann_json nlohmann_json_schema_validator_vendor rclcpp rmf_api_msgs rmf_task_msgs rmf_traffic rmf_traffic_ros2 rmf_utils rmf_websocket ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
