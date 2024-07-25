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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    soccer_object_msgs = substituteSource {
      src = fetchgit {
        name = "soccer_object_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_object_msgs-release.git";
        rev = "662d3ec38925a4ffd53e39d7f4d278f6f611ef2d";
        hash = "sha256-L9tzxNygLV6DbioNwnYhQLIEZ49+s1/LRBiPsBXopTw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_object_msgs";
  version = "1.0.1-4";
  src = sources.soccer_object_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
