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
        rev = "8586cddafdbc6c9e2cf527cd61d9695e481979ba";
        hash = "sha256-SE1uh1UN/58tNIjiQPC9fD7w9YSSVTLF6Bbky2jrdWA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_dotgraph";
  version = "2.2.3-2";
  src = sources.qt_dotgraph;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pydot python_qt_binding ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
