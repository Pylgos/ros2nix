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
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    mapviz_plugins = substituteSource {
      src = fetchgit {
        name = "mapviz_plugins-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "005c3b2059d19ae9d827722e2f040009c2e95f73";
        hash = "sha256-wE4hEUwg2fr+Mvd0/8PBHB/Emj+hZ24bEvd2zIcIGHo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mapviz_plugins";
  version = "2.2.2-1";
  src = sources.mapviz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ros_environment ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ cv_bridge gps_msgs image_transport map_msgs mapviz marti_common_msgs marti_nav_msgs marti_sensor_msgs marti_visualization_msgs nav_msgs pluginlib qt5.qtbase rclcpp rclcpp_action sensor_msgs std_msgs stereo_msgs swri_image_util swri_math_util swri_route_util swri_transform_util tf2 visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
