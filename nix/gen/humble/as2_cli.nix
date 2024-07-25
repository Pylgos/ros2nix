{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    as2_cli = substituteSource {
      src = fetchgit {
        name = "as2_cli-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "0bd7b1143dfda1a72f4461aed669304081bddcec";
        hash = "sha256-LfnKlDiyq+h1Kb1//TfC22sfc/Rnk+BThLE0/TMvj2U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_cli";
  version = "1.0.9-1";
  src = sources.as2_cli;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
