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
    nav_msgs = substituteSource {
      src = fetchgit {
        name = "nav_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "14c1b861ebc0b518a480b134f991150ce5c29ba5";
        hash = "sha256-HvVqNycFJJOymeWT7oq/h1iX6a5rG/C7zpgn3iUH2/8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav_msgs";
  version = "5.0.1-1";
  src = sources.nav_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
