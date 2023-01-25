{ stdenv, lib, fetchFromGitHub, cmake, ignition-cmake,  ignition-common, ignition-msgs, curl, jsoncpp, libyaml, libzip
, majorVersion
, version
, srcSha256
, ...}:

stdenv.mkDerivation rec {
  pname = "ignition-fuel-tools${majorVersion}";
  inherit version;

  src = fetchFromGitHub {
    owner = "ignitionrobotics";
    repo = "ign-fuel-tools";
    rev = "${pname}_${version}";
    sha256 = srcSha256;
  };

  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ignition-cmake ];
  propagatedBuildInputs = [ ignition-common ignition-msgs curl jsoncpp libyaml libzip ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_INCLUDEDIR:PATH=include"
    "-DCMAKE_INSTALL_LIBDIR:PATH=lib"
  ];

  meta = with lib; {
    homepage = "https://ignitionrobotics.org/libs/fuel-tools";
    description = "Classes and tools for interacting with Ignition Fuel";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
