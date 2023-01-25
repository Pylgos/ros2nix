{ buildPythonPackage
, fetchurl
, colcon-argcomplete
, colcon-bash
, colcon-cd
, colcon-cmake
, colcon-core
, colcon-defaults
, colcon-devtools
, colcon-library-path
, colcon-metadata
, colcon-notification
, colcon-output
, colcon-package-information
, colcon-package-selection
, colcon-parallel-executor
, colcon-powershell
, colcon-python-setup-py
, colcon-recursive-crawl
, colcon-ros
, colcon-test-result
, colcon-zsh
}:

buildPythonPackage rec {
  pname = "colcon-common-extensions";
  version = "0.3.0";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/82/a4/04d5840a3ca8e13fc95dc710f9b8c97b379573505291ba42ffa92c94e959/colcon_common_extensions-0.3.0-py3-none-any.whl";
    sha256 = "1506ar6xiz5q1nsp3ny3f0kc3mrk73bh8g5x9rzdr0kww46vkb52";
  };
  format = "wheel";
  doCheck = false;
  buildInputs = [ ];
  checkInputs = [ ];
  nativeBuildInputs = [ ];
  propagatedBuildInputs = [
    colcon-argcomplete
    colcon-bash
    colcon-cd
    colcon-cmake
    colcon-core
    colcon-defaults
    colcon-devtools
    colcon-library-path
    colcon-metadata
    colcon-notification
    colcon-output
    colcon-package-information
    colcon-package-selection
    colcon-parallel-executor
    colcon-powershell
    colcon-python-setup-py
    colcon-recursive-crawl
    colcon-ros
    colcon-test-result
    colcon-zsh
  ];
}
