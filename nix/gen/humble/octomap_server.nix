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
        rev = "605711d841555cf3b4d06895042351356f047266";
        hash = "sha256-qokWpx6Dn8+CCs6PtkaIlxri9WRcZqpqj34kbhZR1Cc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_server";
  version = "2.3.0-1";
  src = sources.octomap_server;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs message_filters nav_msgs octomap_msgs octomap_ros pcl pcl_conversions pcl_ros rclcpp rclcpp_components sensor_msgs std_msgs std_srvs tf2 tf2_eigen tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
