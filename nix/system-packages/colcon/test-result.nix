{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-test-result";
  version = "0.3.8";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/b6/62/a3e327473df5557fc0a2f2d3bc6327b56cbf3df4a2626ab6f58b1da9dcec/colcon_test_result-0.3.8-py3-none-any.whl";
    sha256 = "10p7j3b7x1lx9r76paw1xlk6bhpmmlbdpwlvbd8kqnflzw0zfm0c";
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
