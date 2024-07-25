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
  rclcpp_components,
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
        rev = "07faea1e1b509de76caf924336d36e710c3f80ab";
        hash = "sha256-R4hflOm0V8THTodWUFDvsFQ9PqOVTuK1WMP/joL6M34=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pcl_ros";
  version = "2.5.4-1";
  src = sources.pcl_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs pcl pcl_conversions rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
