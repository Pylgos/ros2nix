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
        rev = "fa1f3f918c4c2616427140ecef862dc68e628b6f";
        hash = "sha256-hot8TlsdjVjgyVkdoUFaIy47vVP67OUYUwJHsdfSm0M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "splsm_7_conversion";
  version = "3.0.1-3";
  src = sources.splsm_7_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct splsm_7 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
