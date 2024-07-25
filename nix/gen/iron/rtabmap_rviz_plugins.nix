{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pcl_conversions,
  pluginlib,
  rclcpp,
  rtabmap_conversions,
  rtabmap_msgs,
  rviz_common,
  rviz_default_plugins,
  rviz_rendering,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "rtabmap_rviz_plugins-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "186980c5beb28c6ccad7f7bed7ac702b774163e2";
        hash = "sha256-Ym++aQZELnnolLYuvqRmWnuNRIB8vXO01qD/f8m1obs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_rviz_plugins";
  version = "0.21.5-1";
  src = sources.rtabmap_rviz_plugins;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pcl_conversions pluginlib rclcpp rtabmap_conversions rtabmap_msgs rviz_common rviz_default_plugins rviz_rendering sensor_msgs std_msgs tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
