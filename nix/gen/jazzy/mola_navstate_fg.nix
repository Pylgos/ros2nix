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
        rev = "ede7cd0157ab8cb724fe22ef40172b711274961d";
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gtsam mola_common mola_imu_preintegration mola_kernel mrpt2 python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
