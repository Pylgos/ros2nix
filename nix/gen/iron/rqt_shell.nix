{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui,
  qt_gui_py_common,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_shell = substituteSource {
      src = fetchgit {
        name = "rqt_shell-source";
        url = "https://github.com/ros2-gbp/rqt_shell-release.git";
        rev = "7f4487160225d6f363a0023e090d11698e3752d7";
        hash = "sha256-Y9ypQtmbnebShkkQTv9ykpR4zWiLUHqwqGw2keXr3gA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_shell";
  version = "1.1.1-3";
  src = sources.rqt_shell;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_gui qt_gui_py_common rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
