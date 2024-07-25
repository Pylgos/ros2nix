{
  ament_cmake,
  buildRosPackage,
  etsi_its_msgs,
  etsi_its_msgs_utils,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  qt5,
  rclcpp,
  ros_environment,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  rviz_rendering,
  rviz_satellite,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    etsi_its_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "etsi_its_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "82ca716b220beaaa13ba4b6f09ddfdd8aa0af32f";
        hash = "sha256-eLfpGd3dSpaQ2mcH2MIscz/9bfubvA2PdaVAbaqKt3g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_rviz_plugins";
  version = "2.0.2-1";
  src = sources.etsi_its_rviz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_msgs etsi_its_msgs_utils pluginlib qt5.qtbase rclcpp rviz2 rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering rviz_satellite tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
