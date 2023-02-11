{ stdenv, lib, fetchFromGitHub, cmake, ignition-math, ignition-cmake, ignition-utils, freeimage, gts, ffmpeg, libuuid, tinyxml-2
, majorVersion
, version
, srcSha256
, ...}:

stdenv.mkDerivation rec {
  pname = "ignition-common${majorVersion}";
  inherit version;

  src = fetchFromGitHub {
    owner = "ignitionrobotics";
    repo = "ign-common";
    rev = "${pname}_${version}";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake ];
  # pkg-config is needed to use some CMake modules in this package
  propagatedBuildInputs = [ ignition-math ignition-cmake ignition-utils freeimage gts ffmpeg libuuid tinyxml-2 ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/common";
    description = "Common Modules for Ignition Projects";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}