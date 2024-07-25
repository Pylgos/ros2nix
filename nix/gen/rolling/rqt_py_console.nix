{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_gui,
  qt_gui_py_common,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_py_console = substituteSource {
      src = fetchgit {
        name = "rqt_py_console-source";
        url = "https://github.com/ros2-gbp/rqt_py_console-release.git";
        rev = "b0285539089d740a61f76e07cbf772f16c2b862f";
        hash = "sha256-ytSOPsH9+KZ4L4EF+TiyIeHsmfFwIKsRO9KYcOILl/k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_py_console";
  version = "1.3.0-1";
  src = sources.rqt_py_console;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_gui qt_gui_py_common rclpy rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
