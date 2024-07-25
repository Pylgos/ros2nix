{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    action_msgs = substituteSource {
      src = fetchgit {
        name = "action_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "715fc5cfffdc8dd84ebb74b6ffda8231ee032c3e";
        hash = "sha256-2ECLCT/VB0k48HVTOrmHkx3hEQftEjtYszess8KxctU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_msgs";
  version = "1.2.1-1";
  src = sources.action_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
