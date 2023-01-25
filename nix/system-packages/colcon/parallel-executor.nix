{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-parallel-executor";
  version = "0.2.4";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/38/3c/138fce728d11383b387e798a1dcd3d15964f45e6308a6b0f6f402c614de0/colcon_parallel_executor-0.2.4-py3-none-any.whl";
    sha256 = "1rgh0l1hxiflr0dpf0hj4kj7041lc52ichc665qpj994xnbx67nw";
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
