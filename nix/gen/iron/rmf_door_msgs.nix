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
    rmf_door_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_door_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "2abcb901d8a7032f76c92724a988b11c66eef944";
        hash = "sha256-+eQB36XNPmTA6gvMXYnygCVjb1FOdhPcVS2AotWnO+Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_door_msgs";
  version = "3.1.2-1";
  src = sources.rmf_door_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
