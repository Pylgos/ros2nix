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
    mola_imu_preintegration = substituteSource {
      src = fetchgit {
        name = "mola_imu_preintegration-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "fd82729c746b72906e746a672e33912d651f7c0f";
        hash = "sha256-cAKpNoFmb63UtwzEUa0OoN2xtBVWydHgFUtwfd6mJKA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_imu_preintegration";
  version = "1.0.6-1";
  src = sources.mola_imu_preintegration;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
