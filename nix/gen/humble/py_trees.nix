{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    py_trees = substituteSource {
      src = fetchgit {
        name = "py_trees-source";
        url = "https://github.com/ros2-gbp/py_trees-release.git";
        rev = "09f39873b4d4685d3e25bfb77e75d821c4f9bc2a";
        hash = "sha256-p5oflZ/NdjN5LocmLAHCXMLzaDRlVOnhvjUIS6AOT3E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "py_trees";
  version = "2.2.3-1";
  src = sources.py_trees;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.setuptools ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pydot ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
