{
  ament_flake8,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  rclpy,
  ros2topic,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
}:
let
  sources = rec {
    rqt_topic = substituteSource {
      src = fetchgit {
        name = "rqt_topic-source";
        url = "https://github.com/ros2-gbp/rqt_topic-release.git";
        rev = "412d3f7290b3bfefc12c991589ca10044ea64252";
        hash = "sha256-1GUkB2gBxpzqAS5sfsL4iVAvf+2hN5+x2nwVzfr6ojQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_topic";
  version = "1.7.2-2";
  src = sources.rqt_topic;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy ros2topic rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}