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
        rev = "86defd59f99edec4f6d6772b8eaacbcb50cd175b";
        hash = "sha256-nMrdYB+RessgluLVeY69cP1jA4ucoAfcxyaNk1gyiSQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "visp";
  version = "3.5.0-4";
  src = sources.visp;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake doxygen ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bzip2 eigen libjpeg liblapack libpng libv4l libxml2 opencv xorg.libX11 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
