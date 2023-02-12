{ fetchPypi
, buildPythonPackage
, catkin-pkg
, pyyaml
, rospkg
}:

buildPythonPackage rec {
  pname = "rosdistro";
  version = "0.9.0";
  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-5+aSdOwhlaLWeCa4MxMNmjC9DYg3oUqHZsrAzmC/pZs=";
  };
  propagatedBuildInputs = [ catkin-pkg pyyaml rospkg ];
} 