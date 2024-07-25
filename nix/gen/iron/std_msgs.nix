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
    std_msgs = substituteSource {
      src = fetchgit {
        name = "std_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "a512f4b9b3ca6b56174b55a7a66210140dac3f58";
        hash = "sha256-O8OCPgR+HqOE1vbgl+OIz0eF6E0MeNYAEFW1GuVDK8I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "std_msgs";
  version = "5.0.1-1";
  src = sources.std_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
