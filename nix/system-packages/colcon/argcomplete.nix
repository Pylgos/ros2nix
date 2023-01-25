{ buildPythonPackage, fetchurl, argcomplete, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-argcomplete";
  version = "0.3.3";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/f1/ef/131788328c9cb5d9882cde4d15dd5aabf2ed6e3d5f09657787c2430812e2/colcon_argcomplete-0.3.3-py3-none-any.whl";
    sha256 = "1m32gdy88yj346i9nfgpwpvxrc9q06wfbfq0kn9ab9ypwyaywn03";
  };
  format = "wheel";
  doCheck = false;
  buildInputs = [ ];
  checkInputs = [ ];
  nativeBuildInputs = [ ];
  propagatedBuildInputs = [
    argcomplete
    colcon-core
  ];
}
