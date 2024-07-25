{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  qt5,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    py_trees_js = substituteSource {
      src = fetchgit {
        name = "py_trees_js-source";
        url = "https://github.com/ros2-gbp/py_trees_js-release.git";
        rev = "b80985cad3437da501a79e29ef8e4247e8a1c347";
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
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.setuptools ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pyqt5 python3Packages.pyqtwebengine python3Packages.pyside2 python3Packages.sip4 qt5.qttools.dev ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
