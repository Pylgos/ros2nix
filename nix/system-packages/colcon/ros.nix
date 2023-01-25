{ buildPythonPackage, fetchurl, catkin-pkg, colcon-cmake, colcon-core, colcon-pkg-config, colcon-python-setup-py, colcon-recursive-crawl }:

buildPythonPackage rec {
  pname = "colcon-ros";
  version = "0.3.23";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/63/a2/bf5d1255d1d35e556416611644689293bc30d56e5227f36abe9ac77161af/colcon_ros-0.3.23-py3-none-any.whl";
    sha256 = "1wghahj5kmdadsfrbx23p2gaf3fsc1r6h8xm58xnw4y6qqikp7ih";
  };
  format = "wheel";
  doCheck = false;
  buildInputs = [ ];
  checkInputs = [ ];
  nativeBuildInputs = [ ];
  propagatedBuildInputs = [
    catkin-pkg
    colcon-cmake
    colcon-core
    colcon-pkg-config
    colcon-python-setup-py
    colcon-recursive-crawl
  ];
}
