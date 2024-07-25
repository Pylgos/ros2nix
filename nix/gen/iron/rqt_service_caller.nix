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
        rev = "76e4774b275e4ac45169096106d4289cfbedefee";
        hash = "sha256-753t5EcS/N6guJU/AO290u88wFHa3b3b4SyUgYms6UQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_service_caller";
  version = "1.1.1-3";
  src = sources.rqt_service_caller;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
