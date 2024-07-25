{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mocap4r2_control,
  mocap4r2_control_msgs,
  qt5,
  qt_gui_cpp,
  rclcpp,
  rqt_gui,
  rqt_gui_cpp,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_mocap4r2_control = substituteSource {
      src = fetchgit {
        name = "rqt_mocap4r2_control-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "a17431dad65ba6d49fb1c6cf4146b51790d944b5";
        hash = "sha256-CthM6oY8M8V+8R98oiDSmWMMtYilLfG7m62cAle8sm8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_mocap4r2_control";
  version = "0.0.7-1";
  src = sources.rqt_mocap4r2_control;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mocap4r2_control mocap4r2_control_msgs qt5.qtbase qt_gui_cpp rclcpp rqt_gui rqt_gui_cpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
