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
        rev = "1d7f913de254220883f0576b45be23afb8e0d256";
        hash = "sha256-YhWQPeBXTOBpMj3CFEOJ8ATUDRGp0Z9F+8jdhAtS4pM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui_cpp";
  version = "1.7.0-1";
  src = sources.rqt_gui_cpp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib qt5.qtbase qt_gui_cpp rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
