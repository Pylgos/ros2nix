{ fetchPypi
, buildPythonPackage
, nose
}:

buildPythonPackage rec {
  pname = "ifcfg";
  version = "0.23";
  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-YktaxUFpPM0+LOzDSMDogVTe1Kqt0lTLIxIS36r9vQI=";
  };
  checkInputs = [ nose ];
} 