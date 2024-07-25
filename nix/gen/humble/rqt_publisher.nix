{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui_py_common,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_publisher = substituteSource {
      src = fetchgit {
        name = "rqt_publisher-source";
        url = "https://github.com/ros2-gbp/rqt_publisher-release.git";
        rev = "6891e03f3e201796e5d5db9067b4801b52afae9b";
        hash = "sha256-TUzzaAtuC8QQpggWr5+VS4qa+8q3Ni6gYYSszPAOxv0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_publisher";
  version = "1.5.0-1";
  src = sources.rqt_publisher;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_gui_py_common rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
