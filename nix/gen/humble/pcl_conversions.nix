{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pcl,
  pcl_msgs,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    pcl_conversions = substituteSource {
      src = fetchgit {
        name = "pcl_conversions-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "b1706cdb42c629514b5769289e776d2d9b58be91";
        hash = "sha256-Yhd4nTb/B3ZWVpZk/WiJMPIqeR7Bp/yWryUXWUuz0bU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pcl_conversions";
  version = "2.4.0-6";
  src = sources.pcl_conversions;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen message_filters pcl pcl_msgs rclcpp sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
