{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  nav_msgs,
  octomap,
  octomap_msgs,
  octomap_ros,
  pcl,
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    octomap_server = substituteSource {
      src = fetchgit {
        name = "octomap_server-source";
        url = "https://github.com/ros2-gbp/octomap_mapping-release.git";
        rev = "5badd9a30530d2d16bec74c459ddbd667e894dfc";
        hash = "sha256-p7gjUVnwb4YKRu0Qi6qrTnyQ/ju7Xpfn2o2FDhdQQKw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_server";
  version = "2.2.0-1";
  src = sources.octomap_server;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs message_filters nav_msgs octomap octomap_msgs octomap_ros pcl pcl_conversions pcl_ros rclcpp rclcpp_components sensor_msgs std_msgs std_srvs tf2 tf2_eigen tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
