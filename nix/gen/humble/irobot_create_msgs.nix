{
  action_msgs,
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
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
    irobot_create_msgs = substituteSource {
      src = fetchgit {
        name = "irobot_create_msgs-source";
        url = "https://github.com/ros2-gbp/irobot_create_msgs-release.git";
        rev = "77836ff7d886185b9661229719a11695c2a6fb88";
        hash = "sha256-PR6lexKHVIKf1ekKgeKoIhj871YNUAWV7d8dh5tKY+8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_msgs";
  version = "2.1.0-1";
  src = sources.irobot_create_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
