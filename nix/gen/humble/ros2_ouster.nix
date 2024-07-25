{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  ouster_msgs,
  pcl,
  pcl_conversions,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  sensor_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    ros2_ouster = substituteSource {
      src = fetchgit {
        name = "ros2_ouster-source";
        url = "https://github.com/ros2-gbp/ros2_ouster_drivers-release.git";
        rev = "fa7e98715ba9bcd16f3e2d9c7755b37cb9e4a820";
        hash = "sha256-Cz5g6bDwXtsWGAd8jXHq1U9le5Q9jzYhO7TBgpnT5sg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_ouster";
  version = "0.4.2-1";
  src = sources.ros2_ouster;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs launch_ros ouster_msgs pcl pcl_conversions rclcpp rclcpp_components rclcpp_lifecycle sensor_msgs std_srvs tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
