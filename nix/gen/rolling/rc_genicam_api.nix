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
        rev = "71681af0a8b4ba1871e5da13cfe4208ed92394e4";
        hash = "sha256-MadM+JVLeVj6ATzpAl5cZN5+iBRhVXF4yg1qwk7tHRA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_genicam_api";
  version = "2.6.5-1";
  src = sources.rc_genicam_api;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libpng libusb1 ncurses ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
