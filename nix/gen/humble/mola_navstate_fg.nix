{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mola_common,
  mola_imu_preintegration,
  mola_kernel,
  mrpt2,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    mola_navstate_fg = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fg-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "cd73f33acd1e224ca5ff808c056ed2958f68b8e5";
        hash = "sha256-pOk8DGxSVAz2XkBVYP09rspvnYzRdpXWTPzenuSFbF4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_navstate_fg";
  version = "1.0.6-1";
  src = sources.mola_navstate_fg;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gtsam mola_common mola_imu_preintegration mola_kernel mrpt2 python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
