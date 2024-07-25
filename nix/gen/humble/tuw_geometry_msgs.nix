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
    tuw_geometry_msgs = substituteSource {
      src = fetchgit {
        name = "tuw_geometry_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "34e4b7a13d88861b3abcde79fa135e86fe612ba5";
        hash = "sha256-HHW+pOnbQxXYFHSRxSk4FOk6i6NXdulgs9krn8f/KAM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tuw_geometry_msgs";
  version = "0.2.1-1";
  src = sources.tuw_geometry_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
