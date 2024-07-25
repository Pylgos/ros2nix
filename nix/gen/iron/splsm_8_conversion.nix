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
        rev = "cfe8a17f56baf6ca65fe043536de0843ac8a962e";
        hash = "sha256-er3NKY9uX3Q2nF3w32RtxZzpqksjsFJ07P9uSZcE91s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "splsm_8_conversion";
  version = "3.1.0-1";
  src = sources.splsm_8_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct splsm_8 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
