{ stdenv, lib, fetchFromGitHub, cmake, ignition-cmake, ignition-math, protobuf, tinyxml-2
, majorVersion
, version
, srcSha256
, ...}:

stdenv.mkDerivation rec {
  pname = "ignition-msgs${majorVersion}";
  inherit version;

  src = fetchFromGitHub {
    owner = "ignitionrobotics";
    repo = "ign-msgs";
    rev = "${pname}_${version}";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ignition-cmake  ];
  propagatedBuildInputs = [ ignition-math protobuf tinyxml-2 ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_INCLUDEDIR:PATH=include"
    "-DCMAKE_INSTALL_LIBDIR:PATH=lib"
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/msgs";
    description = "Protobuf messages and functions for robot applications";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
