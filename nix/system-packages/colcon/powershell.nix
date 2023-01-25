{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-powershell";
  version = "0.3.7";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/16/3b/7705f7dbb1c5e9c6f3a2a6e8a67102d70c161a9afaca28636415e98f791f/colcon_powershell-0.3.7-py3-none-any.whl";
    sha256 = "1ahfgrgh7fccwazxid9b7svcs55a4iknh71qrv0vbg42hfnj7vkp";
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
