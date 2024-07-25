{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rclpy,
  rosidl_default_generators,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  rqt_topic,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_moveit = substituteSource {
      src = fetchgit {
        name = "rqt_moveit-source";
        url = "https://github.com/ros2-gbp/rqt_moveit-release.git";
        rev = "b1b83260449489972fa574810727fb5ad842d893";
        hash = "sha256-A4bGoHfpokKaYjSrBzvtYgzyf6sJGECfPJCIM0iZgYU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_moveit";
  version = "1.0.1-3";
  src = sources.rqt_moveit;
  nativeBuildInputs = [ buildPackages.python3Packages.setuptools rosidl_default_generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy rqt_gui rqt_gui_py rqt_py_common rqt_topic sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
