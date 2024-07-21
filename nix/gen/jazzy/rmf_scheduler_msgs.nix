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
        rev = "ec92a0656c5e758e74c5ff4773cbe8ed24b91d33";
        hash = "sha256-BLugMH1dCJbTLgCKvbTBILeO9aMEYSMIvy193XTz9XI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_scheduler_msgs";
  version = "3.3.1-1";
  src = sources.rmf_scheduler_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}