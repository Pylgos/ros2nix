{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    naoqi_bridge_msgs = substituteSource {
      src = fetchgit {
        name = "naoqi_bridge_msgs-source";
        url = "https://github.com/ros-naoqi/naoqi_bridge_msgs2-release.git";
        rev = "82a4e195b7a21365c937c82ca05ac5bc8c3dcba9";
        hash = "sha256-xdljTAfwNPgy6QtunVz8OO/2cVDUCadY7QMSY4qR1Gc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "naoqi_bridge_msgs";
  version = "2.1.0-1";
  src = sources.naoqi_bridge_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs geometry_msgs nav_msgs rosidl_default_runtime sensor_msgs std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
