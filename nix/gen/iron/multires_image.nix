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
        rev = "5a9f7fada49d3e065eee1b6d5d5bf65fefc63c63";
        hash = "sha256-46lYuv01HWT2Yz96FCPuXhlPCEP4tg0y99izqbgmjEA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "multires_image";
  version = "2.2.2-1";
  src = sources.multires_image;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs gps_msgs mapviz pluginlib qt5.qtbase rclcpp rclpy swri_math_util swri_transform_util tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
