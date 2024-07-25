{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  splsm_8,
  substituteSource,
}:
let
  sources = rec {
    splsm_8_conversion = substituteSource {
      src = fetchgit {
        name = "splsm_8_conversion-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "8252a08492202fbb6582194bd7b7465435b052a9";
        hash = "sha256-JFwL2GR/REst5zNuUWumSf5/+Us1BewHvhTe2A7T89k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "splsm_8_conversion";
  version = "2.1.0-1";
  src = sources.splsm_8_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct splsm_8 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
