{
  buildPythonPackage,
  fetchPypi,
}:

buildPythonPackage rec {
  pname = "rosdistro";
  version = "0.9.1";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-RwOCS1hwS8oZBhMuO9PUK6cq9zhh7QPVoZJUeKcr+ys=";
  };
}
