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
        rev = "11294cb88bb430f7ed55cb7b6c1c78490c9d90a2";
        hash = "sha256-SBEcP4Y+TXaa48MuzVZFTz5yTdxD8PWZtUTP5VE6dgY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui_py";
  version = "1.1.7-1";
  src = sources.rqt_gui_py;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt_gui rqt_gui ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
