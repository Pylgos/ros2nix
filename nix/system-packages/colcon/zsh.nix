{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-zsh";
  version = "0.4.0";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/48/25/cf7402e097e131de81c0b3700db1ed745f7c19054c0535b630a340e0c6c6/colcon_zsh-0.4.0-py3-none-any.whl";
    sha256 = "1d970aagqxhd40knbykxgqld6hxjfp8pk5capwxxchjzrv1phka7";
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
