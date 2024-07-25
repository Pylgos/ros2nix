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
        rev = "71df6d2cc661220cb7217d02e2195cb9cc7714a5";
        hash = "sha256-8SUxGGn601U+eY/bv6s47i/0hXOnRNrwgBXNj1GGDxc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_graph";
  version = "1.4.2-1";
  src = sources.rqt_graph;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_dotgraph rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
