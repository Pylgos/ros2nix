{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    imu_complementary_filter = substituteSource {
      src = fetchgit {
        name = "imu_complementary_filter-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "d6e1ddaaa52010b10e218178a0a3371806ce4b1b";
        hash = "sha256-kPPY/UhAq3XZ1BFaGYMoE8IuKH67Dyuc7Pih7/4eY1Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_complementary_filter";
  version = "2.1.4-1";
  src = sources.imu_complementary_filter;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs message_filters rclcpp sensor_msgs std_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}