{
  buildPythonPackage,
  fetchPypi,
  flake8,
  pycodestyle,
  setuptools,
}:

buildPythonPackage rec {
  pname = "flake8-comprehensions";
  version = "3.15.0";
  format = "pyproject";

  src = fetchPypi {
    pname = "flake8_comprehensions";
    inherit version;
    hash = "sha256-kjwiYD4DEDdqa1WwPv69wJdTxp8tl3dVy6i7c0WKXU0=";
  };

  buildInputs = [ setuptools ];
  propagatedBuildInputs = [ pycodestyle ];
  nativeCheckInputs = [ flake8 ];

  pythonImportsCheck = [ "flake8_comprehensions" ];
}
