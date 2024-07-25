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
        rev = "61bb63c8fea769107c73ab9280237476739c74f5";
        hash = "sha256-c4ZYyZ/oWSdtnOhSouKx9RHCuVTsYikllci0a9xKDb4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui_py";
  version = "1.7.0-1";
  src = sources.rqt_gui_py;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt_gui rqt_gui ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
