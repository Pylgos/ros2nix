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
    mola_input_kitti_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "4a9622d2265d148cdc37e5d42896322e4c0d459e";
        hash = "sha256-x6wxSZsH+m0OjwJkwpwy5pStOAeyeY2Vue06sDfpBTw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_kitti_dataset";
  version = "1.0.6-1";
  src = sources.mola_input_kitti_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
