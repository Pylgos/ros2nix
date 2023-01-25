{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-package-information";
  version = "0.3.3";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/db/2d/1e8dd59ff38afa9032935f9a8da43bfea5e95b2ef3f0c2a0953bf44bb8e2/colcon_package_information-0.3.3-py3-none-any.whl";
    sha256 = "164zfzlfmpkxmyv6vx9nbk7iy8m9iij3jqxwlgm3x96vaap7hzjv";
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
