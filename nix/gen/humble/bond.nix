{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
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
    bond = substituteSource {
      src = fetchgit {
        name = "bond-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "737763f459640e20bc0519f346c7ba7931e98938";
        hash = "sha256-N4+IcUgo5TYYAbwzeklsCCFv1OsVKthF396gnTGCrYM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bond";
  version = "3.0.2-3";
  src = sources.bond;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
