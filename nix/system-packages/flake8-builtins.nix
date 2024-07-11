{
  buildPythonPackage,
  fetchPypi,
  flake8,
  setuptools,
  hatchling,
}:

buildPythonPackage rec {
  pname = "flake8-builtins";
  version = "2.5.0";
  format = "pyproject";

  src = fetchPypi {
    pname = "flake8_builtins";
    inherit version;
    hash = "sha256-vao92CPk9TCMXnEtGfpfadqlJ4Hqh09eqcNje89W+qY=";
  };

  buildInputs = [ setuptools ];
  propagatedBuildInputs = [ hatchling ];
  nativeCheckInputs = [ flake8 ];

  pythonImportsCheck = [ "flake8_builtins" ];
}
