{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt_gui,
  substituteSource,
}:
let
  sources = rec {
    qt_gui_app = substituteSource {
      src = fetchgit {
        name = "qt_gui_app-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "3930bb62257a42688018d6f9c6e445fc670f1946";
        hash = "sha256-OU68D6ke+OYEcT00UuAmVxqOKUeC5NEf4XwD7qMKLMI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_app";
  version = "2.7.4-2";
  src = sources.qt_gui_app;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt_gui ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}