{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  rqt_msg,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_action = substituteSource {
      src = fetchgit {
        name = "rqt_action-source";
        url = "https://github.com/ros2-gbp/rqt_action-release.git";
        rev = "35ec0c7a5a48e96905cf10359886ad6032a3b356";
        hash = "sha256-YE20Hf//2FHYnbnCI5YOD9PWfHDi8xkZwtt5cRkz1io=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_action";
  version = "2.0.1-3";
  src = sources.rqt_action;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy rqt_gui rqt_gui_py rqt_msg rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
