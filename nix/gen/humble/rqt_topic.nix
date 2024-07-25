{
  ament_flake8,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_topic = substituteSource {
      src = fetchgit {
        name = "rqt_topic-source";
        url = "https://github.com/ros2-gbp/rqt_topic-release.git";
        rev = "ae77d100cfdd79d04bfc4e3d426036167b0fa9cd";
        hash = "sha256-AjYYpTRSF3CLhU/5RnqU2KzpJa09q5YbUTnA5oruE94=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_topic";
  version = "1.5.0-1";
  src = sources.rqt_topic;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
