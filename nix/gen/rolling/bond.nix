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
        rev = "82d969fd8e47936b242a110a50c59f27eeadc253";
        hash = "sha256-HumzPokICAnb7HyYW4rIhMDSZ8ZnZ+tzQ6LqYn9/dDU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bond";
  version = "4.1.0-1";
  src = sources.bond;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}