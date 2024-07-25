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
        rev = "822187aa31e12f4f3db945aa6d4d646d70bc92fe";
        hash = "sha256-43epRC/O71DBEZOqg6FJMar7MfsgfIxKI7BHVsztRQY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_reconfigure";
  version = "1.3.4-1";
  src = sources.rqt_reconfigure;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_gui_py_common rclpy rqt_console rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
