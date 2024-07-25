{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  qt5,
  qt_gui,
  qt_gui_cpp,
  rclcpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_gui_cpp = substituteSource {
      src = fetchgit {
        name = "rqt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "d19bec8f13b476672137167044c51143c5311d95";
        hash = "sha256-oB1tEa7O+2Y1UUAuQsJoKHZhWkjjNXduxO2x01tJKNo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui_cpp";
  version = "1.3.4-1";
  src = sources.rqt_gui_cpp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib qt5.qtbase qt_gui qt_gui_cpp rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
