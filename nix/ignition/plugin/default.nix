{ stdenv, lib, fetchFromGitHub, cmake, ignition-cmake
, majorVersion
, version
, srcSha256
, ...}:

stdenv.mkDerivation rec {
  pname = "ignition-plugin${majorVersion}";
  inherit version;

  src = fetchFromGitHub {
    owner = "ignitionrobotics";
    repo = "ign-plugin";
    rev = "ignition-plugin_${version}";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ignition-cmake ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_INCLUDEDIR:PATH=include"
    "-DCMAKE_INSTALL_LIBDIR:PATH=lib"
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/plugin";
    description = "Library for registering plugin libraries and dynamically loading them at runtime.";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
