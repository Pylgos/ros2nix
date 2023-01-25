{ buildPythonPackage, fetchurl, colcon-core }:

buildPythonPackage rec {
  pname = "colcon-recursive-crawl";
  version = "0.2.1";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/0e/5e/55d7b5daf8cb92c3313e0481fad59030a76be07624be140f8df72d0b2622/colcon_recursive_crawl-0.2.1-py3-none-any.whl";
    sha256 = "1prmvb7qyn2p3xrd4nfajc2ivch67zl7ygxzz68s9qhyhdaiwgmc";
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
