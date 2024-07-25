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
  off_highway_general_purpose_radar_msgs,
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    off_highway_general_purpose_radar = substituteSource {
      src = fetchgit {
        name = "off_highway_general_purpose_radar-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "233c1de37aca02e0e712ba28717801c4eb533ffd";
        hash = "sha256-8H9bDtfd6rXVtH7E65va5LBAK9LEymba8ewQBBBFo3k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_general_purpose_radar";
  version = "0.6.2-1";
  src = sources.off_highway_general_purpose_radar;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs off_highway_can off_highway_general_purpose_radar_msgs pcl_conversions pcl_ros rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
