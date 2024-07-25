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
    rmf_scheduler_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_scheduler_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "6d3fe80d1ef757bb685d086ecb8aa785cf92ff54";
        hash = "sha256-vnlliCZ2IN+T37KmpqHpXB6tqTZBUeQC9NYUD95iJLU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_scheduler_msgs";
  version = "3.0.4-1";
  src = sources.rmf_scheduler_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
