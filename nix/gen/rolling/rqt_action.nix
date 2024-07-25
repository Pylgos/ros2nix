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
        rev = "55dd23a694f1bceba5f1d3bc26893e4d8194acd5";
        hash = "sha256-c7Q3DoUUYVugs2Hu5w1qmS/qM5Spa5By2NOxCVS/ZsI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_action";
  version = "2.3.0-1";
  src = sources.rqt_action;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_gui rqt_gui_py rqt_msg rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}