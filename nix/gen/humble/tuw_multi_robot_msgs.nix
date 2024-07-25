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
    tuw_multi_robot_msgs = substituteSource {
      src = fetchgit {
        name = "tuw_multi_robot_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "0d921023e0414f1ad1da49e2c0ee11c04e6b9d60";
        hash = "sha256-zD3/uLA48AHHNlfTo3fw+BW5QsqezdsXR84buUok3Q4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tuw_multi_robot_msgs";
  version = "0.2.1-1";
  src = sources.tuw_multi_robot_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
