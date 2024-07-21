{
  ament_flake8,
  ament_index_python,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  rclpy,
  rosidl_runtime_py,
  rqt_console,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
}:
let
  sources = rec {
    rqt_msg = substituteSource {
      src = fetchgit {
        name = "rqt_msg-source";
        url = "https://github.com/ros2-gbp/rqt_msg-release.git";
        rev = "0171aafa8d1dd700e104ee98421ee4a5e4ea45d3";
        hash = "sha256-AD3nHOjjAOHbKFshSLeo7W57HAIhBjMJzfzM0woKsQk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_msg";
  version = "1.5.1-3";
  src = sources.rqt_msg;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy rosidl_runtime_py rqt_console rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
