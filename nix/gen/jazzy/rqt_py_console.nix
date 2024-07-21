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
}:
let
  sources = rec {
    rqt_py_console = substituteSource {
      src = fetchgit {
        name = "rqt_py_console-source";
        url = "https://github.com/ros2-gbp/rqt_py_console-release.git";
        rev = "7ee2c10f1fdbe6e5dc8fd76689d626cd9ea08d45";
        hash = "sha256-DmiST+nR2HDVS8cVQioQqII2/Kt+zIocmOUuhtsYGgY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_py_console";
  version = "1.2.2-3";
  src = sources.rqt_py_console;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_gui qt_gui_py_common rclpy rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}