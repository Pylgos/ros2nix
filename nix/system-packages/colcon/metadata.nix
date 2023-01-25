{ buildPythonPackage, fetchurl, pyyaml, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-metadata";
  version = "0.2.5";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/7d/bc/de4ad65f79a38a86f2bef0f24b09512c3e205e7261b20ebe0c2fe451847a/colcon_metadata-0.2.5-py3-none-any.whl";
    sha256 = "18b7kd83pb27zs26y8j3dmxbyjfhmn3mw2vvlz1izwvmc9cn3fbw";
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
