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
        rev = "dbc98e24eeda8b1c2c59fd91c4018892778e1ec2";
        hash = "sha256-wdZEF99LMWE3KRQTzUrtE1JZUt727BQnCwis8jD2NyU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bond_core";
  version = "3.0.2-3";
  src = sources.bond_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bond bondcpp smclib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
