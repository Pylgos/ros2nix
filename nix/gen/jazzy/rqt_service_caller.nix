{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
}:
let
  sources = rec {
    rqt_service_caller = substituteSource {
      src = fetchgit {
        name = "rqt_service_caller-source";
        url = "https://github.com/ros2-gbp/rqt_service_caller-release.git";
        rev = "e98925d2967198ddbd60bb9df580fd8dff129f3d";
        hash = "sha256-SkbOwJQXbq432M9Ogjsl0vOfVi+A35O7CltyhS/2lk8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_service_caller";
  version = "1.2.1-3";
  src = sources.rqt_service_caller;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}