{ stdenv, lib, fetchFromGitHub, cmake, ignition-cmake, ignition-math, ignition-common, ignition-plugin, glew, freeimage, freeglut, xorg, ogre1_9, boost
, majorVersion
, version
, srcSha256
, ...}:

stdenv.mkDerivation rec {
  pname = "ignition-rendering${majorVersion}";
  inherit version;

  src = fetchFromGitHub {
    owner = "ignitionrobotics";
    repo = "ign-rendering";
    rev = "${pname}_${version}";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ignition-cmake ];
  propagatedBuildInputs = [ ignition-math ignition-common ignition-plugin glew freeimage freeglut xorg.libXmu xorg.libXi ogre1_9 boost ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_INCLUDEDIR:PATH=include"
    "-DCMAKE_INSTALL_LIBDIR:PATH=lib"
    "-DSKIP_ogre2=true"
    "-DSKIP_optix=true"
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/math";
    description = "Rendering library for robot applications";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
