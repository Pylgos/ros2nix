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
        rev = "40579e7c751095b9add34bc8060cd95ada214ab0";
        hash = "sha256-nMrdYB+RessgluLVeY69cP1jA4ucoAfcxyaNk1gyiSQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "visp";
  version = "3.5.0-3";
  src = sources.visp;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bzip2 eigen libjpeg liblapack libpng libv4l libxml2 opencv xorg.libX11 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}