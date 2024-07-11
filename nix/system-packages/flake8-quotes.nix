{
  buildPythonPackage,
  fetchPypi,
  flake8,
  pycodestyle,
}:

buildPythonPackage rec {
  pname = "flake8-quotes";
  version = "3.4.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qthJL7cQotPqvmjF+GoUKN5lDISEEn4UxD0FBLowJ2w=";
  };

  propagatedBuildInputs = [ pycodestyle ];

  nativeCheckInputs = [ flake8 ];

  pythonImportsCheck = [ "flake8_quotes" ];
}
