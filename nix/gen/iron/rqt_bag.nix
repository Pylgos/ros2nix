{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rclpy,
  rosbag2_py,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_bag = substituteSource {
      src = fetchgit {
        name = "rqt_bag-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "0131c9f2ca66dd6ccbc1c6cd930c39a050b333fa";
        hash = "sha256-D/KVXKUFjHPcBOld3LUEDvdn8KtjmJ/un9kv01FfEzM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_bag";
  version = "1.3.4-1";
  src = sources.rqt_bag;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy rosbag2_py rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
