{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  can_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  off_highway_can,
  off_highway_radar_msgs,
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    off_highway_radar = substituteSource {
      src = fetchgit {
        name = "off_highway_radar-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "0d3f93ff82f5b0f2d5d07a923a15d19686f5a98e";
        hash = "sha256-wiFjQLM2hOxjcQTdXzfQoT12vQZZ18kDZL2NPaIsiGM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_radar";
  version = "0.6.2-1";
  src = sources.off_highway_radar;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs off_highway_can off_highway_radar_msgs pcl_conversions pcl_ros rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
