{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pluginlib,
  qt5,
  rclcpp,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_imu_plugin = substituteSource {
      src = fetchgit {
        name = "rviz_imu_plugin-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "904cb409e0d79a31f2929d50bda103249c496ed4";
        hash = "sha256-Ve4ClRA+kkXcWgIqaDhQOlKTrTYODFV3aGvhCMk/jXM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_imu_plugin";
  version = "2.1.4-1";
  src = sources.rviz_imu_plugin;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib qt5.qtbase rclcpp rviz_common rviz_ogre_vendor rviz_rendering sensor_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
