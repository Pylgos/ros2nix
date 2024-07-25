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
        rev = "78f7ade13b9467e31455cc020079e0bf95f19b6b";
        hash = "sha256-UwKuIGylL2/Tw3/NSz54LyA5rTXKsgVTjdzvytkaeI0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosgraph_msgs";
  version = "1.6.0-2";
  src = sources.rosgraph_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
