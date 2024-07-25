{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt_gui,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_gui_app = substituteSource {
      src = fetchgit {
        name = "qt_gui_app-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "4b80cfa229d3b86dd1ff2e91af20454c24d19878";
        hash = "sha256-si8PGKB4Adn0aqKMQ00lQULECUAxy1/omiUnaRSY9bY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_app";
  version = "2.8.1-1";
  src = sources.qt_gui_app;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt_gui ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
