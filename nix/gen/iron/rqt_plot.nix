{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_gui_py_common,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_plot = substituteSource {
      src = fetchgit {
        name = "rqt_plot-source";
        url = "https://github.com/ros2-gbp/rqt_plot-release.git";
        rev = "c9e3ed57f0759eba194f306a69ff8233c9394584";
        hash = "sha256-0w5q8BGUqDfIA8nSetLgt1l2IjvmXu7EHGp5sPX80/s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_plot";
  version = "1.2.3-1";
  src = sources.rqt_plot;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.matplotlib python_qt_binding qt_gui_py_common rclpy rqt_gui rqt_gui_py rqt_py_common std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
