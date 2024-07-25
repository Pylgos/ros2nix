{
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui,
  rclpy,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_gui = substituteSource {
      src = fetchgit {
        name = "rqt_gui-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "1dd43224e471dba5622f9fd6064c287445b1ed0b";
        hash = "sha256-XLljfDknzD2S3m8CaddH6uVHrgorH4Iuz78cb7+oqMc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui";
  version = "1.1.7-1";
  src = sources.rqt_gui;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_gui rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
