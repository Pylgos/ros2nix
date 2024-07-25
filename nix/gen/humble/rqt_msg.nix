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
        rev = "de089c4bcaf5ad5ecbfc65cd387f526812330c08";
        hash = "sha256-FyLj4I2R0NF5DK+LFLMbZCOzhfm9D5wwkNzFC9odAgE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_msg";
  version = "1.2.0-1";
  src = sources.rqt_msg;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy rqt_console rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
