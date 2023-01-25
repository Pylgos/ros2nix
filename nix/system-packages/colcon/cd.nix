{ buildPythonPackage, fetchurl, colcon-core, colcon-package-information }:

buildPythonPackage rec {
  pname = "colcon-cd";
  version = "0.1.1";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/b1/83/58212820793dba91ac3d123cffae5eb3d51543116e8341ebf0dda87a5d5e/colcon_cd-0.1.1-py3-none-any.whl";
    sha256 = "1rngkrldippc5a41wwqzz1i9g0g5rd1fg5rpn9nrb6jybnpz7a1w";
  };
  format = "wheel";
  doCheck = false;
  buildInputs = [ ];
  checkInputs = [ ];
  nativeBuildInputs = [ ];
  propagatedBuildInputs = [
    colcon-core
    colcon-package-information
  ];
}