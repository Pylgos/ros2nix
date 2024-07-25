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
        rev = "cb98377c13a7a8e8b579f3b9a99f92fa2341255e";
        hash = "sha256-CN6RtR7IiOsVECIrYtVQO0QOQ8MuY2y6p6PZyMHfhNk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_dotgraph";
  version = "2.4.3-1";
  src = sources.qt_dotgraph;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pydot python_qt_binding ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
