{
  buildRosPackage,
  bzip2,
  cmake,
  doxygen,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libjpeg,
  liblapack,
  libpng,
  libv4l,
  libxml2,
  opencv,
  substituteSource,
  xorg,
}:
let
  sources = rec {
    visp = substituteSource {
      src = fetchgit {
        name = "visp-source";
        url = "https://github.com/ros2-gbp/visp-release.git";
        rev = "c5b45df014e51b0dd4fc4a30a0d07f31c0dca6b8";
        hash = "sha256-nMrdYB+RessgluLVeY69cP1jA4ucoAfcxyaNk1gyiSQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "visp";
  version = "3.5.0-2";
  src = sources.visp;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bzip2 eigen libjpeg liblapack libpng libv4l libxml2 opencv xorg.libX11 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
