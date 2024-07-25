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
        rev = "2b6a674f07fc0e50b5ddabee254f753db7f1b051";
        hash = "sha256-tkLQhDnJ07zqcvEC2NwYHiqBciBwQluTxFlMGkuGAys=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_scheduler_msgs";
  version = "3.1.2-1";
  src = sources.rmf_scheduler_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
