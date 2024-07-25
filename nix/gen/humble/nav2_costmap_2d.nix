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
        rev = "eec452a4f9ba526b74821b199565747db7adc13f";
        hash = "sha256-b3dw6CxH+cWImMdE1J24euvOyEjFKkq/ufOMVrORWLU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_costmap_2d";
  version = "1.1.15-1";
  src = sources.nav2_costmap_2d;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles geometry_msgs laser_geometry map_msgs message_filters nav2_common nav2_msgs nav2_util nav2_voxel_grid nav_msgs pluginlib rclcpp rclcpp_lifecycle sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros tf2_sensor_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
