{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_yaml,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_kernel = substituteSource {
      src = fetchgit {
        name = "mola_kernel-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "f09572f00499f15f3a03dbb2545a4791fb0981ce";
        hash = "sha256-T6yYunIpMJXMfUiSDYOOwWFC2Rewjq1uNU9uR60TmVs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_kernel";
  version = "1.0.6-1";
  src = sources.mola_kernel;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_yaml mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
