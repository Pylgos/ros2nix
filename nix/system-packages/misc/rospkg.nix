{ fetchPypi
, buildPythonPackage
, catkin-pkg
, distro
, pyyaml
, lsb-release
}:

buildPythonPackage rec {
  pname = "rospkg";
  version = "1.4.0";
  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-7yJFYApTRayMna1S+mpPvGvM/KQREer50bOZqQVcANQ=";
  };
  propagatedBuildInputs = [ catkin-pkg distro pyyaml lsb-release ];
} 