{
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui,
  qt_gui_py_common,
  rclpy,
  rosidl_default_generators,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
}:
let
  sources = rec {
    rqt_robot_monitor = substituteSource {
      src = fetchgit {
        name = "rqt_robot_monitor-source";
        url = "https://github.com/ros2-gbp/rqt_robot_monitor-release.git";
        rev = "1841f5ee767e52b37a7884478766445acad7b0a5";
        hash = "sha256-8SFE5pix0PTYkcufr7ovmE/HYmjWyGUdT073Kolmm4I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_robot_monitor";
  version = "1.0.6-1";
  src = sources.rqt_robot_monitor;
  nativeBuildInputs = [ rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs python_qt_binding qt_gui qt_gui_py_common rclpy rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
