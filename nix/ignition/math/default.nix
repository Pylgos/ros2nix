{ stdenv, lib, fetchFromGitHub, cmake, eigen, ignition-cmake
, majorVersion
, version
, srcSha256
, ...}:

stdenv.mkDerivation rec {
  pname = "ignition-math${majorVersion}";
  inherit version;

  src = fetchFromGitHub {
    owner = "ignitionrobotics";
    repo = "ign-math";
    rev = "${pname}_${version}";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ignition-cmake eigen ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_INCLUDEDIR:PATH=include"
    "-DCMAKE_INSTALL_LIBDIR:PATH=lib"
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/math";
    description = "Math classes and functions for robot applications";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
