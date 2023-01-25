{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-library-path";
  version = "0.2.1";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/b8/02/4e4dd0cb94491774e87cf479066a8b6ef1f653889a0c9fb957f527c165f7/colcon_library_path-0.2.1-py3-none-any.whl";
    sha256 = "08db9rpj6rj0jgz71ccf6fv8r18n9msds100fys7d1rapy3jzpg8";
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
