{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
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
        rev = "7e917fa7b8777491b727bf1c21c636314e7eb4b2";
        hash = "sha256-CHctqUN41fi65Rm1W2uGlb/HQKeUYoFN4V5P1mhpbCg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_graph";
  version = "1.3.1-1";
  src = sources.rqt_graph;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_dotgraph rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
