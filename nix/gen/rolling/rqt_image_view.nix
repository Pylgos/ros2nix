{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_transport,
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
    rqt_image_view = substituteSource {
      src = fetchgit {
        name = "rqt_image_view-source";
        url = "https://github.com/ros2-gbp/rqt_image_view-release.git";
        rev = "04f951986b694c547d718f8ad62b7a6019a8d127";
        hash = "sha256-yg3Ts00hd8hELleYHejS5qrq7xSwPt9WphpSoj5mBTY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_image_view";
  version = "1.3.0-1";
  src = sources.rqt_image_view;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs image_transport qt5.qtbase qt_gui_cpp rclcpp rqt_gui rqt_gui_cpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}