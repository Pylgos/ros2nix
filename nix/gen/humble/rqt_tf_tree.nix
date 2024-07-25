{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_dotgraph,
  rclpy,
  rqt_graph,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  tf2_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_tf_tree = substituteSource {
      src = fetchgit {
        name = "rqt_tf_tree-source";
        url = "https://github.com/ros2-gbp/rqt_tf_tree-release.git";
        rev = "bef8d3e511c6458c7a3c481fff3b54aff5d1c2cb";
        hash = "sha256-waY5Aa3qycV9O2EEFcztdpfuu+CFOxb42p7gI/IuZUU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_tf_tree";
  version = "1.0.5-1";
  src = sources.rqt_tf_tree;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_dotgraph rclpy rqt_graph rqt_gui rqt_gui_py tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
