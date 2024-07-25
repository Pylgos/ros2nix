{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_service_caller = substituteSource {
      src = fetchgit {
        name = "rqt_service_caller-source";
        url = "https://github.com/ros2-gbp/rqt_service_caller-release.git";
        rev = "0e31ca73773890dede6e92dc4a97b02d0716e975";
        hash = "sha256-ZIAMenPCiVlqoXUvFI0pukwPJC43v4GOkQH7JEHO9W4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_service_caller";
  version = "1.0.5-3";
  src = sources.rqt_service_caller;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
