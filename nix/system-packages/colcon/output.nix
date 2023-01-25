{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-output";
  version = "0.2.12";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/0d/94/8fba9d05861d1e12dcba01ca77bc48cccef8c0b3fcb04d5d814e073a3ddb/colcon_output-0.2.12-py3-none-any.whl";
    sha256 = "1p79801dlcsg1i7bppclql2kf26niw1gcn6wddrkjcvqhnyd3jdm";
  };
  format = "wheel";
  doCheck = false;
  buildInputs = [ ];
  checkInputs = [ ];
  nativeBuildInputs = [ ];
  propagatedBuildInputs = [
    colcon-core
  ];
}
