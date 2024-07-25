{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    cob_msgs = substituteSource {
      src = fetchgit {
        name = "cob_msgs-source";
        url = "https://github.com/4am-robotics/cob_common-release.git";
        rev = "c2f9c2cc91346e8c9b615b1851458b96f9d9bb2a";
        hash = "sha256-Ms6ZiL0XGS7bRMQlXtAUdEsAo6hl8WqhxNW11DCBYck=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cob_msgs";
  version = "2.7.10-1";
  src = sources.cob_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces diagnostic_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
