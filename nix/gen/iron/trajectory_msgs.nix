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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    trajectory_msgs = substituteSource {
      src = fetchgit {
        name = "trajectory_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "fb3c9515121f0dbf489127808baa4312ea51f2ca";
        hash = "sha256-AmJZVE7qNXNDTDm26ekXggWb4LFOgrOVRiwu0J4x44k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "trajectory_msgs";
  version = "5.0.1-1";
  src = sources.trajectory_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
