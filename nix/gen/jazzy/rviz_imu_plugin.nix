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
}:
let
  sources = rec {
    rviz_imu_plugin = substituteSource {
      src = fetchgit {
        name = "rviz_imu_plugin-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "53a0f03e5450e57519355b0c71ba1d9eddeac71d";
        hash = "sha256-PTP1jn127e3dBx0iCfyHU2gcO709T+HE0I+CZyIHCJY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_imu_plugin";
  version = "2.1.3-4";
  src = sources.rviz_imu_plugin;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ message_filters pluginlib qt5.qtbase rclcpp rviz_common rviz_ogre_vendor rviz_rendering sensor_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
