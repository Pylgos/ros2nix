{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
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
        rev = "f0003430001f037847fb1e35fac2686ae4deca04";
        hash = "sha256-Uu8set6iD1hG7a1Fs3vC9zKtHR6/tpjWarcszYoin10=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_console";
  version = "2.0.3-1";
  src = sources.rqt_console;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rcl_interfaces rclpy rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
