{
  buildRosPackage,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
}:
let
  sources = rec {
    rqt_controller_manager = substituteSource {
      src = fetchgit {
        name = "rqt_controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "3b00a5315234065f7ddb2e900565d421c803123f";
        hash = "sha256-ZtI/PCNDvUZjVrCCQ+Qz+Aqq6popQqRsIy3eeYuMUH8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_controller_manager";
  version = "4.11.0-1";
  src = sources.rqt_controller_manager;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager controller_manager_msgs rclpy rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
