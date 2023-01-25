{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-bash";
  version = "0.4.2";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/25/34/4ce7e4776c6f4bc1e88b92f00689cd938d902c69cc8609c0991a690e225e/colcon_bash-0.4.2-py3-none-any.whl";
    sha256 = "0r2mbwrmrm7lb874qlx8m8gab86drdxmsrhhr35ar5xdllglnv7b";
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
