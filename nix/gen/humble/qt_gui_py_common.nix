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
        rev = "723480ab7eb4b81b1389ee44f080392283b13795";
        hash = "sha256-9Uhrxps4ZNDjU5YsXidrCsqdgdy2dB7n0yFp+XErWq4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_py_common";
  version = "2.2.3-2";
  src = sources.qt_gui_py_common;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
