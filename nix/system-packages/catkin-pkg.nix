{
  buildPythonPackage,
  fetchPypi,
  pyparsing,
  dateutil,
  docutils,
}:

buildPythonPackage rec {
  pname = "catkin_pkg";
  version = "1.0.0";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-R26fUpFygvRkc5JBtLyvXrv7qaemjZr4+HUiX+rA4bU=";
  };
  propagatedBuildInputs = [
    pyparsing
    dateutil
    docutils
  ];
}
