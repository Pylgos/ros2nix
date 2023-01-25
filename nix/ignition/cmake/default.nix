{ stdenv, lib, fetchFromGitHub, cmake, pkg-config
, majorVersion
, version
, srcSha256
, ...}:

stdenv.mkDerivation rec {
  pname = "ignition-cmake${majorVersion}";
  inherit version;

  src = fetchFromGitHub {
    owner = "ignitionrobotics";
    repo = "ign-cmake";
    rev = "${pname}_${version}";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake ];
  # pkg-config is needed to use some CMake modules in this package
  propagatedBuildInputs = [ pkg-config ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/cmake";
    description = "CMake Modules for Ignition Projects";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}