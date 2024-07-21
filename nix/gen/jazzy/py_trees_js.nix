{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  qt5,
  substituteSource,
}:
let
  sources = rec {
    py_trees_js = substituteSource {
      src = fetchgit {
        name = "py_trees_js-source";
        url = "https://github.com/ros2-gbp/py_trees_js-release.git";
        rev = "ecad3cd6b72e461cf22b476a470920dae68e82f1";
        hash = "sha256-F1WhgnqYpmF486ZKeT63iO5+AVvNSxET33OZrdH0/88=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "py_trees_js";
  version = "0.6.4-1";
  src = sources.py_trees_js;
  nativeBuildInputs = [ buildPackages.python3Packages.setuptools ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qttools.dev ];
  propagatedBuildInputs = [ python3Packages.pyqtwebengine python3Packages.pyside2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}