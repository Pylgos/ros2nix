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
        rev = "071adce3750546f0a6e466f84df0492d455dbf4f";
        hash = "sha256-IETnneGNZeFXQnPwu5DnuKYASxigLUtMbnxyrUarKjs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui_cpp";
  version = "1.1.7-1";
  src = sources.rqt_gui_cpp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib qt5.qtbase qt_gui qt_gui_cpp rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
