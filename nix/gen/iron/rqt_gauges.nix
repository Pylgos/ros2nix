{
  ament_flake8,
  ament_index_python,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt_gui,
  qt_gui_py_common,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_gauges = substituteSource {
      src = fetchgit {
        name = "rqt_gauges-source";
        url = "https://github.com/ros2-gbp/rqt_gauges-release.git";
        rev = "ae6823666f18482029a42dda1423e5bb74bb5564";
        hash = "sha256-ie5l6SHrK6cQczLp2R3MdzrJRVZGAxGnuO7NzFIwbJY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gauges";
  version = "0.0.3-1";
  src = sources.rqt_gauges;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt_gui qt_gui_py_common rclpy rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
