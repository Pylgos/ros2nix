{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python_qt_binding,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
}:
let
  sources = rec {
    rqt_robot_steering = substituteSource {
      src = fetchgit {
        name = "rqt_robot_steering-source";
        url = "https://github.com/ros2-gbp/rqt_robot_steering-release.git";
        rev = "0bbc8ad54804819c3b35ca495bc285825d9a0b03";
        hash = "sha256-GQCdfFYxE/yR3Eostcf+T9VKwP2N45EzidAhXz5uVrw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_robot_steering";
  version = "1.0.0-6";
  src = sources.rqt_robot_steering;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs python_qt_binding rclpy rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}