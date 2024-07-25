{
  ament_cmake,
  bond,
  bondcpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  smclib,
  substituteSource,
}:
let
  sources = rec {
    bond_core = substituteSource {
      src = fetchgit {
        name = "bond_core-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "5bb0f53b6d5285098a2f870389c9662f1abae4fc";
        hash = "sha256-EA4f2CqUNq+ZLOettwEaG01DA+oOf6FFtQqVi7RDQOI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bond_core";
  version = "4.0.0-4";
  src = sources.bond_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bond bondcpp smclib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
