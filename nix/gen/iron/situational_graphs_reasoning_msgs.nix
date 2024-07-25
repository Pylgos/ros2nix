{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    situational_graphs_reasoning_msgs = substituteSource {
      src = fetchgit {
        name = "situational_graphs_reasoning_msgs-source";
        url = "https://github.com/ros2-gbp/situational_graphs_reasoning_msgs-release.git";
        rev = "ba19f3c716743d2e564dd205b774fe4e14ef35b4";
        hash = "sha256-Hidi+3OFpGL+wpTIWImKPXrKKtrtoj7pBMnutO0z8SM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "situational_graphs_reasoning_msgs";
  version = "0.0.0-1";
  src = sources.situational_graphs_reasoning_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
