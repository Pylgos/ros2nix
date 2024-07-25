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
  python3Packages,
  rclcpp,
  rmf_utils,
  substituteSource,
  websocketpp,
}:
let
  sources = rec {
    rmf_websocket = substituteSource {
      src = fetchgit {
        name = "rmf_websocket-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "89e612579d9daf155f898bdf6a3cb19d2c295e31";
        hash = "sha256-0AzsR9R2YUVCtlNRCECcHn+6zBg0ui1f2K5OVxAFyMI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_websocket";
  version = "2.1.8-1";
  src = sources.rmf_websocket;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen nlohmann_json nlohmann_json_schema_validator_vendor python3Packages.boost rclcpp rmf_utils websocketpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
