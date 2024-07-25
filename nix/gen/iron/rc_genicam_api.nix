{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  libpng,
  libusb1,
  substituteSource,
}:
let
  sources = rec {
    rc_genicam_api = substituteSource {
      src = fetchgit {
        name = "rc_genicam_api-source";
        url = "https://github.com/ros2-gbp/rc_genicam_api-release.git";
        rev = "8c8b1c33246e83815cc7c6ce43c9cfb895916eb4";
        hash = "sha256-7vto7CZidCpb/NNmPxatTPJJf/cpc3E5HksraWU0fOQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_genicam_api";
  version = "2.6.1-3";
  src = sources.rc_genicam_api;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libpng libusb1 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
