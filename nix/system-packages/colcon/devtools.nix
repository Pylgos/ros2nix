{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-devtools";
  version = "0.2.3";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/69/4a/8d2a17bb3d8a77b48aaa5ca9a4e4d1cf49dd5ce01f13b0d63bce8c06af65/colcon_devtools-0.2.3-py3-none-any.whl";
    sha256 = "0cpk016smccph66vq7sqam9b2nqhms96z2dpzwqrsdlgx5as5hzr";
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
