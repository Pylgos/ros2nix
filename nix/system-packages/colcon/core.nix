{ buildPythonApplication, buildPythonPackage, fetchurl, makeWrapper, empy, distlib, pytest, pytest-cov, pytest-repeat, pytest-rerunfailures, setuptools }:


let
  withExtensions = extensions: buildPythonApplication {
    pname = "colcon";
    inherit (package) version;
    format = "other";

    dontUnpack = true;
    dontBuild = true;
    doCheck = false;

    nativeBuildInputs = [ makeWrapper ];
    buildInputs = [ package ] ++ extensions;

    installPhase = ''
      makeWrapper '${package}/bin/colcon' "$out/bin/colcon" \
        --prefix PYTHONPATH : "$PYTHONPATH"
    '';

    passthru = package.passthru // {
      withPlugins = moreExtensions: withExtensions (moreExtensions ++ extensions);
    };
  };
  package = buildPythonPackage rec {
    pname = "colcon-core";
    version = "0.10.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/3f/50/43873c17fb8fe97c3b49b54600c8c8486a44c9d8268521ed29b8d957037b/colcon_core-0.10.0-py3-none-any.whl";
      sha256 = "0s8s15hla21s5a2b9c5jf51wiiw3xg4x7g2q6qr2h9hk4ybmxfs2";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [ ];
    checkInputs = [ ];
    nativeBuildInputs = [ ];
    propagatedBuildInputs = [
      empy
      distlib
      pytest
      pytest-cov
      pytest-repeat
      pytest-rerunfailures
      setuptools
    ];
    passthru = {
      inherit withExtensions;
    };
  };
in
package
