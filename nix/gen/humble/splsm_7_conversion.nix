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
        rev = "0b5b18c3cfff1fc55b0f2318a801f021207f5347";
        hash = "sha256-+ByB7SfUuMBwq94GLSUN0Kn/gh4NyH7UnJhS9AsVhf8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "splsm_7_conversion";
  version = "2.1.0-1";
  src = sources.splsm_7_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct splsm_7 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
