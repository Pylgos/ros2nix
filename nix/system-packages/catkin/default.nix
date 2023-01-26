{ buildPythonPackage
, fetchurl
, docutils
, pyparsing
, dateutil
, setuptools
}:

buildPythonPackage rec {
  pname = "catkin-pkg";
  version = "0.5.2";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/d7/52/a5395120c9a9a92837d7daf28c4fd26df50ed6e291244c70fef1a1caa5c2/catkin_pkg-0.5.2-py3-none-any.whl";
    sha256 = "0n9livna1nbbfg0nf1mrz9k9b7hrng49m5qc2w7gkf31493gyxsg";
  };
  format = "wheel";
  doCheck = false;
  buildInputs = [ ];
  checkInputs = [ ];
  nativeBuildInputs = [ ];
  propagatedBuildInputs = [
    docutils
    pyparsing
    dateutil
    setuptools
  ];
}
