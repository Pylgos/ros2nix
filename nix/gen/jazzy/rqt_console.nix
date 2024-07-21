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
}:
let
  sources = rec {
    rqt_console = substituteSource {
      src = fetchgit {
        name = "rqt_console-source";
        url = "https://github.com/ros2-gbp/rqt_console-release.git";
        rev = "4e7179b14078dcbeec86ec11008b37b74f5ba133";
        hash = "sha256-nnitj5EX/4GJUalogu9OlEP1Bql0LuzLuCV6Ib+myAo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_console";
  version = "2.2.1-3";
  src = sources.rqt_console;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rcl_interfaces rclpy rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
