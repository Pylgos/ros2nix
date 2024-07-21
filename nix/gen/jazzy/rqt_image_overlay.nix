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
}:
let
  sources = rec {
    rqt_image_overlay = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "3b47252303977088f137c8bc94c0b375f98e4bf5";
        hash = "sha256-rjv8Zxu7V4qDtMRcwMdiYByPpFiYIRJL8N+KK/Gte+E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_image_overlay";
  version = "0.3.1-4";
  src = sources.rqt_image_overlay;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ image_transport pluginlib qt5.qtbase rclcpp ros_image_to_qimage rqt_gui rqt_gui_cpp rqt_image_overlay_layer ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}