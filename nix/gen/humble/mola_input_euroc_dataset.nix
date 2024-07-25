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
    mola_input_euroc_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_euroc_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "82f7a7b27d2a9223c29d1f391a82ebca628e4379";
        hash = "sha256-4G5pzRTKcZysRrzJ9Y7K3iUMytOyAjXVs1Vn6dOP6K0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_euroc_dataset";
  version = "1.0.6-1";
  src = sources.mola_input_euroc_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
