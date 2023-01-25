{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-pkg-config";
  version = "0.1.0";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/75/28/d738200c7eed21cd78df901fa78818618f5b85dd39ea7c3905b367fcb033/colcon_pkg_config-0.1.0-py3-none-any.whl";
    sha256 = "01j2h1697lmfjfqdbkrnnhqdg7rv902gx02sncscbky8km1aly9s";
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
