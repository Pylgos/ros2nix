{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gps_msgs,
  mapviz,
  pluginlib,
  qt5,
  rclcpp,
  rclpy,
  substituteSource,
  swri_math_util,
  swri_transform_util,
  tf2,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    multires_image = substituteSource {
      src = fetchgit {
        name = "multires_image-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "c0146fb82e2967484651ad8de3a2693689d7b531";
        hash = "sha256-C/YntTAM03IlwNEOv5XOa8dFk6npzqX9sydiqUja/jw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "multires_image";
  version = "2.2.1-1";
  src = sources.multires_image;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs gps_msgs mapviz pluginlib qt5.qtbase rclcpp rclpy swri_math_util swri_transform_util tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
