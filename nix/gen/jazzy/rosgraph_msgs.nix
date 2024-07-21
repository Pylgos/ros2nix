{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rosgraph_msgs = substituteSource {
      src = fetchgit {
        name = "rosgraph_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "9af86c0d06f950a298f48c4380eb93646a25bd91";
        hash = "sha256-hEDZCurb6TJooZeBv+lAeDryX6S2nIjCRJkpeItDr0o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosgraph_msgs";
  version = "2.0.2-2";
  src = sources.rosgraph_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}