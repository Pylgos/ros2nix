{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_gui_py_common,
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
    rqt_reconfigure = substituteSource {
      src = fetchgit {
        name = "rqt_reconfigure-source";
        url = "https://github.com/ros2-gbp/rqt_reconfigure-release.git";
        rev = "6c3295518fa31f3dccc64b4b37bf84e2abb0027a";
        hash = "sha256-ThnCAIGGrmrx8NAdfSMTjsXM8l4EPYJfg9bSORYEL2U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_reconfigure";
  version = "1.7.0-1";
  src = sources.rqt_reconfigure;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_gui_py_common rclpy rqt_console rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}