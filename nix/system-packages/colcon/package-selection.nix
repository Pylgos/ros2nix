{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-package-selection";
  version = "0.2.10";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/6f/58/fb91adaab07ed20865839acd45a6f88a030751c19688e4781d556d34a1b5/colcon_package_selection-0.2.10-py3-none-any.whl";
    sha256 = "17lq2bh2k1hjp6l8hrv7zymsgs2cc924i57p1i0v7ri1f6cz2659";
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
