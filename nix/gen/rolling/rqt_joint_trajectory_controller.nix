{
  buildRosPackage,
  control_msgs,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  trajectory_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_joint_trajectory_controller = substituteSource {
      src = fetchgit {
        name = "rqt_joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "06bd9b770f6a3e9da385bacc490df7be915dc78e";
        hash = "sha256-2DF2SfrHjFh3DFjVSQGgywC7Bcq2idhh31g50HLacfI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_joint_trajectory_controller";
  version = "4.10.0-1";
  src = sources.rqt_joint_trajectory_controller;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs controller_manager_msgs python_qt_binding qt_gui rclpy rqt_gui rqt_gui_py trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
