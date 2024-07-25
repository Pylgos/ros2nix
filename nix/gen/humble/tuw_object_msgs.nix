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
    tuw_object_msgs = substituteSource {
      src = fetchgit {
        name = "tuw_object_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "c8cc32e01f673fa0bbf4e3409e240369c6fee955";
        hash = "sha256-Vo0IDcxdw+VC4/U7R5AxIANarE4MHR8wx9kIt2VYfXA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tuw_object_msgs";
  version = "0.2.1-1";
  src = sources.tuw_object_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
