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
    rmf_workcell_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_workcell_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "c42e7f89636368d1e8b3fb6632341fb1446e999d";
        hash = "sha256-GQjHm0Aq6YYxGN3knCal9m5q0hYTiyCxRbBFSGXJgME=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_workcell_msgs";
  version = "3.1.2-1";
  src = sources.rmf_workcell_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
