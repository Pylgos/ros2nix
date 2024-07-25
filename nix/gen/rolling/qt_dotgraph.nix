{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_dotgraph = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "c9fdb2ef7227566aa02a10e28819dcdb93cb1d4e";
        hash = "sha256-MvddpqVOQ4oHTg1uNPRrNjYayGfO+Bd/ebfOnkrOXkM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_dotgraph";
  version = "2.8.1-1";
  src = sources.qt_dotgraph;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pydot python_qt_binding ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
