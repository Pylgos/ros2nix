{ buildPythonPackage, fetchurl, colcon-core, notify2 }:

buildPythonPackage rec {
  pname = "colcon-notification";
  version = "0.2.14";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/f4/0a/4917feb5125d273da3c6f5cec3f6e4a1e356fab1b25189d6111adc8b0ad0/colcon_notification-0.2.14-py3-none-any.whl";
    sha256 = "0krgqwf7rxixnwps6r04y914mr2gxcjy4bzza23ci84d2j4kfz20";
  };
  format = "wheel";
  doCheck = false;
  buildInputs = [ ];
  checkInputs = [ ];
  nativeBuildInputs = [ ];
  propagatedBuildInputs = [
    colcon-core
    notify2
  ];
}
