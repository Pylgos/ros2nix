{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt5,
  substituteSource,
  tango_icons_vendor,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_gui = substituteSource {
      src = fetchgit {
        name = "qt_gui-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "5ceecce5428dd162238efccd3607d01b832595a9";
        hash = "sha256-AFvsztcud0FQPSdVidOKYeYFGlBszsybOYG9zyvEkJ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui";
  version = "2.4.3-1";
  src = sources.qt_gui;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pyqt5 python3Packages.pyside2 python3Packages.sip4 python_qt_binding qt5.qtbase tango_icons_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
