{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rclpy,
  rqt_console,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_msg = substituteSource {
      src = fetchgit {
        name = "rqt_msg-source";
        url = "https://github.com/ros2-gbp/rqt_msg-release.git";
        rev = "f7d24d6d50311709999f5918e73ff37a58644e5c";
        hash = "sha256-yhA5UQ8zXoDI4hhVmUGA4zXhCz0NG56FhNGn376wRew=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_msg";
  version = "1.3.1-3";
  src = sources.rqt_msg;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy rqt_console rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
