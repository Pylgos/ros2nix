{ buildPythonPackage, fetchPypi, cmake, colcon-core, colcon-library-path, colcon-test-result }:

buildPythonPackage rec {
  pname = "colcon-cmake";
  version = "0.2.27";
  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-9XlFUMp/n/tFVd5FQiflZqC+tciIHXZQnbMze5k3DyY=";
  };
  doCheck = false;
  buildInputs = [ ];
  checkInputs = [ ];
  dontUseCmakeConfigure = true;
  nativeBuildInputs = [ ];
  propagatedBuildInputs = [
    colcon-core
    colcon-library-path
    colcon-test-result
  ];
  nativePropagatedBuildInputs = [
  ];
  postPatch = ''
    substituteInPlace colcon_cmake/task/cmake/__init__.py \
      --replace "'cmake'" "'${cmake}/bin/cmake'"
  '';
}
