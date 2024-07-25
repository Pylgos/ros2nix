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
        rev = "d4c10fdd5154116dd7a5573f8f8ffc0542c1bf29";
        hash = "sha256-Ra51fXjvtW9ql3mCwRobTiVXRpN3lGPI2nRH/wTu8RQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_joint_trajectory_controller";
  version = "3.24.0-1";
  src = sources.rqt_joint_trajectory_controller;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs controller_manager_msgs python_qt_binding qt_gui rclpy rqt_gui rqt_gui_py trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
