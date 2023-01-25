{ buildPythonPackage, fetchurl, pyyaml, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-defaults";
  version = "0.2.6";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/ce/8c/c51a6d0f552d8f1a63937d82d265736bad64aeda907b49e84e691fcd2bab/colcon_defaults-0.2.6-py3-none-any.whl";
    sha256 = "1v0vrkjlkmk20k6bspx8s6xgj3kan8kmvs2w040p4kjqf9b8z7ch";
  };
  format = "wheel";
  doCheck = false;
  buildInputs = [ ];
  checkInputs = [ ];
  nativeBuildInputs = [ ];
  propagatedBuildInputs = [
    pyyaml
    colcon-core
  ];
}
