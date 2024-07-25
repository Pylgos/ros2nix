{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  laser_geometry,
  launch,
  launch_ros,
  message_filters,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  tf2_sensor_msgs,
}:
let
  sources = rec {
    pointcloud_to_laserscan = substituteSource {
      src = fetchgit {
        name = "pointcloud_to_laserscan-source";
        url = "https://github.com/ros2-gbp/pointcloud_to_laserscan-release.git";
        rev = "63df2e3229ec0f89246b237f1e127d9c5c79ecdc";
        hash = "sha256-JPlIFeKS6DMGh6xSWvg9EPxL1diI2e9udRprTb9LzZE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pointcloud_to_laserscan";
  version = "2.0.1-4";
  src = sources.pointcloud_to_laserscan;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ laser_geometry launch_ros message_filters rclcpp rclcpp_components sensor_msgs tf2 tf2_ros tf2_sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
