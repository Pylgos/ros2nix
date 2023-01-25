{ buildPythonPackage, fetchurl, colcon-core, setuptools }:

buildPythonPackage rec {
  pname = "colcon-python-setup-py";
  version = "0.2.8";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/08/96/8c8a0575f400e00451b9bc8ba0f30b4f417f13205bf14892c88e4fbb1968/colcon_python_setup_py-0.2.8-py3-none-any.whl";
    sha256 = "1mvrznxqggkkbp0yn4jfrbq0c7i0gn0nmbby97qgwmzgv51jpcns";
  };
  format = "wheel";
  doCheck = false;
  buildInputs = [ ];
  checkInputs = [ ];
  nativeBuildInputs = [ ];
  propagatedBuildInputs = [
    colcon-core
    setuptools
  ];
}
