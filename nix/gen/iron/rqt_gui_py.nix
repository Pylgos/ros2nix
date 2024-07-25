{
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt_gui,
  rqt_gui,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_gui_py = substituteSource {
      src = fetchgit {
        name = "rqt_gui_py-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "f57ea5fbc157954d0317fd31764264ffc43ff9e2";
        hash = "sha256-8cxIcFbIU6WPc2EFap1lAQmD004gGGc2AZX9gSlPRYY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui_py";
  version = "1.3.4-1";
  src = sources.rqt_gui_py;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt_gui rqt_gui ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
