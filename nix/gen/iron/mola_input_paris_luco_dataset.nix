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
    mola_input_paris_luco_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_paris_luco_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "2af4e4a471c1c9c87e2ec6a5ef249bc1973b4e46";
        hash = "sha256-uT7VSGCguyjsyLWSGJElRtpqtzFVsnCScv1a0RL+MjM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_paris_luco_dataset";
  version = "1.0.6-1";
  src = sources.mola_input_paris_luco_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
