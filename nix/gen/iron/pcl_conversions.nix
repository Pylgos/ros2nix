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
        rev = "154c27b364f478bf8ceee89185ffb962ca419eb8";
        hash = "sha256-hpWF0RVEp9W9FDF6yZdo12EaHVw0ivznsWp66o4tHUk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pcl_conversions";
  version = "2.5.4-1";
  src = sources.pcl_conversions;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen message_filters pcl pcl_msgs rclcpp sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
