{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  libpng,
  libusb1,
  ncurses,
  substituteSource,
}:
let
  sources = rec {
    rc_genicam_api = substituteSource {
      src = fetchgit {
        name = "rc_genicam_api-source";
        url = "https://github.com/ros2-gbp/rc_genicam_api-release.git";
        rev = "57bf6c445677c596d425b929c0f82266f98c1cda";
        hash = "sha256-bp8a9UBIdmzBsLXwZO86DD8/PxRp2Bl0HRWOS+fWgOg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_genicam_api";
  version = "2.6.5-2";
  src = sources.rc_genicam_api;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libpng libusb1 ncurses ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
