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
        rev = "8d874dec7aef192be9b0dfa87875944782bfbc92";
        hash = "sha256-X3GHcEegbG/Z45tA1fhYO3xlE1Fr0WKRaNpZRXYhF2Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_image_view";
  version = "1.2.0-2";
  src = sources.rqt_image_view;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs image_transport qt5.qtbase qt_gui_cpp rclcpp rqt_gui rqt_gui_cpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
