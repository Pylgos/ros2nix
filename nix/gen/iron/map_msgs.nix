{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    map_msgs = substituteSource {
      src = fetchgit {
        name = "map_msgs-source";
        url = "https://github.com/ros2-gbp/navigation_msgs-release.git";
        rev = "e892a6ba7a23a62bce05b0b98ac60faa3b4ec3b7";
        hash = "sha256-CJgR8kEpS+TfT+32/Bpt4CBdXsFcI+jVc3fbyzdKGp4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "map_msgs";
  version = "2.2.0-3";
  src = sources.map_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
