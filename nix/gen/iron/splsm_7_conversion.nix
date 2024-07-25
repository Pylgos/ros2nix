{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  splsm_7,
  substituteSource,
}:
let
  sources = rec {
    splsm_7_conversion = substituteSource {
      src = fetchgit {
        name = "splsm_7_conversion-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "0e22f0d183009598ad8dc47e01b1e0a63ea4a43d";
        hash = "sha256-XIqbDaF9tJF7s++GgE2U5HzzDT1qDX1tPKY33SQr6Bk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "splsm_7_conversion";
  version = "3.1.0-1";
  src = sources.splsm_7_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct splsm_7 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
