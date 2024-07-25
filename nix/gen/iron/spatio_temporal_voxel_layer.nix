{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  laser_geometry,
  message_filters,
  nav2_costmap_2d,
  openexr,
  openvdb_vendor,
  pcl,
  pcl_conversions,
  pluginlib,
  rclcpp,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    spatio_temporal_voxel_layer = substituteSource {
      src = fetchgit {
        name = "spatio_temporal_voxel_layer-source";
        url = "https://github.com/SteveMacenski/spatio_temporal_voxel_layer-release.git";
        rev = "158b858466036ebd212a7192c0def3803d20730c";
        hash = "sha256-/LIWMZjfqckkjKu9Ly4X6t3JAkgN9fGq3gACZlrRe8c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spatio_temporal_voxel_layer";
  version = "2.4.0-1";
  src = sources.spatio_temporal_voxel_layer;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs laser_geometry message_filters nav2_costmap_2d openexr openvdb_vendor pcl pcl_conversions pluginlib rclcpp rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2_geometry_msgs tf2_ros tf2_sensor_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
