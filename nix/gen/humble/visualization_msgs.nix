{
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
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    visualization_msgs = substituteSource {
      src = fetchgit {
        name = "visualization_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "8c3f8aabdb0a64c94e5f5b52adff8f2b3cb5878e";
        hash = "sha256-UF3ZuJ6C6S4nXpfNT2UIJri4l50BePlBPyxPOwIJ8dU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "visualization_msgs";
  version = "4.2.4-1";
  src = sources.visualization_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
