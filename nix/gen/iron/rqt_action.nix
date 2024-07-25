{
  ament_flake8,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rqt_gui,
  rqt_gui_py,
  rqt_msg,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_action = substituteSource {
      src = fetchgit {
        name = "rqt_action-source";
        url = "https://github.com/ros2-gbp/rqt_action-release.git";
        rev = "90baff1b6ccf9baa789660ccd63305c8d1af104a";
        hash = "sha256-35751we0+CsVsr5VncDhELg08qi7RoP2SR+V+WM5Z8Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_action";
  version = "2.1.2-3";
  src = sources.rqt_action;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_gui rqt_gui_py rqt_msg rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
