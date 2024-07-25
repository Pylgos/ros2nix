{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  laser_geometry,
  map_msgs,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_voxel_grid,
  nav_msgs,
  pluginlib,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nonpersistent_voxel_layer = substituteSource {
      src = fetchgit {
        name = "nonpersistent_voxel_layer-source";
        url = "https://github.com/SteveMacenski/nonpersistent_voxel_layer-release.git";
        rev = "669ff117d40fecf065ff84c809330335c05cb07a";
        hash = "sha256-NZJcaaZPg+3PGoM/gLwmjg77MU5vl5fBoO7midZMwZ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nonpersistent_voxel_layer";
  version = "2.4.0-1";
  src = sources.nonpersistent_voxel_layer;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs laser_geometry map_msgs nav2_costmap_2d nav2_msgs nav2_voxel_grid nav_msgs pluginlib rclcpp sensor_msgs std_msgs tf2 tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
