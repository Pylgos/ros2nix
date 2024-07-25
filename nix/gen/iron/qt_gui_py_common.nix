{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_gui_py_common = substituteSource {
      src = fetchgit {
        name = "qt_gui_py_common-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "dcfa8c342c077952ce1f60eebc2570e0d65d5f74";
        hash = "sha256-ak71ZDjEzMtd6KXaczL6MV9OPGADFKHcg27oQy4l0b0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_py_common";
  version = "2.4.3-1";
  src = sources.qt_gui_py_common;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
