{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libnabo,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    libpointmatcher = substituteSource {
      src = fetchgit {
        name = "libpointmatcher-source";
        url = "https://github.com/ros2-gbp/libpointmatcher-release.git";
        rev = "0ed5b47746e28c0e56fde1b7aa17bdc0200bd58c";
        hash = "sha256-80SUcbIPClDWJx8kZMLEk7AsJ63OH30H+6d4EFLUnp4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libpointmatcher";
  version = "1.3.1-3";
  src = sources.libpointmatcher;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libnabo python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
