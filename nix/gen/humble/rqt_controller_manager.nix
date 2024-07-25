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
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_controller_manager = substituteSource {
      src = fetchgit {
        name = "rqt_controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "1a8a20a7c0abbfd1091e55a1b949c734f8b1aacd";
        hash = "sha256-QZlCuvK6SaxRJB8fsA6zuvPC1Y4BgwuGk5g4guRj1VM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_controller_manager";
  version = "2.41.0-1";
  src = sources.rqt_controller_manager;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager controller_manager_msgs rclpy rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
