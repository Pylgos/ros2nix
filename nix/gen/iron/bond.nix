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
        rev = "27651e43d4a7ebaf44fb0aaa9e0b7f081cabb18b";
        hash = "sha256-c8CNFiNhffaL6ikNaC25RLYzu6olhlMYnXu9X6CoK+U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bond";
  version = "4.0.0-4";
  src = sources.bond;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
