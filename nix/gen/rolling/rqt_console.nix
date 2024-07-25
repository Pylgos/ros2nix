{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  rcl_interfaces,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_console = substituteSource {
      src = fetchgit {
        name = "rqt_console-source";
        url = "https://github.com/ros2-gbp/rqt_console-release.git";
        rev = "7687bc5a9cc8ac81046ef38b3a8258f5dcc7057f";
        hash = "sha256-rF3jOEKJh1Dxf55KPt0uAahS9Tsrze7kdEnUyVnwylE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_console";
  version = "2.3.0-1";
  src = sources.rqt_console;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rcl_interfaces rclpy rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
