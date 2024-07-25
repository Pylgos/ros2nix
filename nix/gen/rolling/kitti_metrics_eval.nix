{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    kitti_metrics_eval = substituteSource {
      src = fetchgit {
        name = "kitti_metrics_eval-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "4abf4dc023fe58e4423e99a209518f873e73ab56";
        hash = "sha256-Yawv8N6uShKzEr+S/EdzFcQ/y5+4CW07tYSLKrqFKl0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kitti_metrics_eval";
  version = "1.0.6-1";
  src = sources.kitti_metrics_eval;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
