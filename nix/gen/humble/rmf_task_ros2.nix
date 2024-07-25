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
        rev = "4fb441d5da6195342305704502ed72caa9f9683d";
        hash = "sha256-v5K5Ou1J3mYsVbpWoh7xj63iJ04mLL+6SpkG2lHYN0g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task_ros2";
  version = "2.1.8-1";
  src = sources.rmf_task_ros2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen nlohmann_json nlohmann_json_schema_validator_vendor rclcpp rmf_api_msgs rmf_task_msgs rmf_traffic rmf_traffic_ros2 rmf_utils rmf_websocket ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
