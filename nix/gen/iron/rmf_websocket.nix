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
        rev = "c0ede0830163732561ff4d63418d87ccaaa42bf5";
        hash = "sha256-otYjMCsLP92ifEhtD3gPmpGLgJFNjGZocGrhfyCJDNc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_websocket";
  version = "2.2.5-1";
  src = sources.rmf_websocket;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen nlohmann_json nlohmann_json_schema_validator_vendor python3Packages.boost rclcpp rmf_utils websocketpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
