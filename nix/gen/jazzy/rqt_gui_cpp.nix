{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  qt5,
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
        rev = "0ff9411e1fae5cdb1942231565a13b10a85d001b";
        hash = "sha256-JJ48LH0MfEaVb8AgbGKYBZ2v/ihBf0A2MZ267/+zhDY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui_cpp";
  version = "1.6.0-2";
  src = sources.rqt_gui_cpp;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib qt5.qtbase qt_gui_cpp rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
