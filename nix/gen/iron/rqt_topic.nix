{
  ament_flake8,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rclpy,
  ros2topic,
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
        rev = "cf0c114bd2da16cef1750a7c7c98d76999572dfd";
        hash = "sha256-85OwdYBmOZjAVuHUBxbZiXGHJOSag6Kh30E/X1M9baY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_topic";
  version = "1.6.1-3";
  src = sources.rqt_topic;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy ros2topic rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
