{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_gui,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_runtime_monitor = substituteSource {
      src = fetchgit {
        name = "rqt_runtime_monitor-source";
        url = "https://github.com/ros2-gbp/rqt_runtime_monitor-release.git";
        rev = "b47ea2988f7401dcbf6e3ec16360c352defcbdcb";
        hash = "sha256-7LyebmhKcj1ltMsj4LbDUxXX5v9ejuW4g4lIKitP28Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_runtime_monitor";
  version = "1.0.0-3";
  src = sources.rqt_runtime_monitor;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs python_qt_binding qt_gui rclpy rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
