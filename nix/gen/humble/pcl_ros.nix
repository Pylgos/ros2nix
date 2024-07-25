{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  pcl,
  pcl_conversions,
  rclcpp,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    pcl_ros = substituteSource {
      src = fetchgit {
        name = "pcl_ros-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "3522a4423dd789c8e8697a46f2b59c56079e4acc";
        hash = "sha256-y37VynRX0MmG+KHoNnewCb8S6U4+GBY8nETGRMq+pY8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pcl_ros";
  version = "2.4.0-6";
  src = sources.pcl_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs pcl pcl_conversions rclcpp sensor_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
