{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rqt_gui,
  rqt_gui_cpp,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt = substituteSource {
      src = fetchgit {
        name = "rqt-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "e92e416f91c5a5c7f73045f76943ef19dfc0cca4";
        hash = "sha256-n+E+nBMbXZ/UKxN1bZeF/15Gm2nu95XOy9wG+lRpbsU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt";
  version = "1.1.7-1";
  src = sources.rqt;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_gui rqt_gui_cpp rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
