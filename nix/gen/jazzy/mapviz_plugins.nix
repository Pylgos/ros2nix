{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gps_msgs,
  image_transport,
  map_msgs,
  mapviz,
  marti_common_msgs,
  marti_nav_msgs,
  marti_sensor_msgs,
  marti_visualization_msgs,
  nav_msgs,
  pluginlib,
  qt5,
  rclcpp,
  rclcpp_action,
  ros_environment,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  swri_image_util,
  swri_math_util,
  swri_route_util,
  swri_transform_util,
  tf2,
  visualization_msgs,
}:
let
  sources = rec {
    mapviz_plugins = substituteSource {
      src = fetchgit {
        name = "mapviz_plugins-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "753bce671094fcfc07cdd2be85d9a8d08671f98f";
        hash = "sha256-Uv0w5dSfMSuB3oQZadzM2gPcdxIXoR+wiLnsLZVECk4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mapviz_plugins";
  version = "2.3.0-3";
  src = sources.mapviz_plugins;
  nativeBuildInputs = [ ament_cmake ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ ament_index_cpp cv_bridge gps_msgs image_transport map_msgs mapviz marti_common_msgs marti_nav_msgs marti_sensor_msgs marti_visualization_msgs nav_msgs pluginlib qt5.qtbase rclcpp rclcpp_action sensor_msgs std_msgs stereo_msgs swri_image_util swri_math_util swri_route_util swri_transform_util tf2 visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
