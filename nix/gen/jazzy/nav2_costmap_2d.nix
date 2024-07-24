{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  laser_geometry,
  launch,
  launch_testing,
  map_msgs,
  message_filters,
  nav2_common,
  nav2_lifecycle_manager,
  nav2_map_server,
  nav2_msgs,
  nav2_util,
  nav2_voxel_grid,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_costmap_2d = substituteSource {
      src = fetchgit {
        name = "nav2_costmap_2d-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "47f10eb53318b49a3b34ebacd11c97cc090ae48c";
        hash = "sha256-WR6tTG35bWxhd/Wfny25mob40W1pahFQ7InJwWzCW40=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_costmap_2d";
  version = "1.3.1-1";
  src = sources.nav2_costmap_2d;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles geometry_msgs laser_geometry map_msgs message_filters nav2_common nav2_msgs nav2_util nav2_voxel_grid nav_msgs pluginlib rclcpp rclcpp_lifecycle sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros tf2_sensor_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
