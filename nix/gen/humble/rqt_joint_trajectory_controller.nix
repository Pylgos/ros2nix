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
        rev = "353bed97054eac574d9e76f63624a79c2a0e5468";
        hash = "sha256-yGHauRFWXNIKkZCM2WIjeDYX9IHnCJYgKvyngPomqhM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_joint_trajectory_controller";
  version = "2.35.0-1";
  src = sources.rqt_joint_trajectory_controller;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs controller_manager_msgs python_qt_binding qt_gui rclpy rqt_gui rqt_gui_py trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
