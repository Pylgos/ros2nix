{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_kernel,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_input_mulran_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_mulran_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "16a63b4ef671f2352afc40a8a3c6c878213bf67c";
        hash = "sha256-Pyd6LDUfq4Dcf8avJuvr/Rv/SOZtmHHylgA0ddopQSI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_mulran_dataset";
  version = "1.0.6-1";
  src = sources.mola_input_mulran_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
