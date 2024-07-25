{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  compressed_image_transport,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  pluginlib,
  qt5,
  rclcpp,
  ros_image_to_qimage,
  rqt_gui,
  rqt_gui_cpp,
  rqt_image_overlay_layer,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_image_overlay = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "21a5457794b5abc8893f31092e6de6f397b7822b";
        hash = "sha256-rPS2F9QZ5QONO3jPFhyrtwhELpio617S9fbPeCfkqYk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_image_overlay";
  version = "0.1.3-1";
  src = sources.rqt_image_overlay;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ image_transport pluginlib qt5.qtbase rclcpp ros_image_to_qimage rqt_gui rqt_gui_cpp rqt_image_overlay_layer ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
