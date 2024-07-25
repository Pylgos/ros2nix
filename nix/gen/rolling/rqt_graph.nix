{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_dotgraph,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_graph = substituteSource {
      src = fetchgit {
        name = "rqt_graph-source";
        url = "https://github.com/ros2-gbp/rqt_graph-release.git";
        rev = "ee550e5c05b41bc1eaac99aca04377257c1831d3";
        hash = "sha256-mG3hkj+3Q9TYLwdj6I9eWb5UoHiup4+rK2ScooB7yzE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_graph";
  version = "1.6.1-1";
  src = sources.rqt_graph;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_dotgraph rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
