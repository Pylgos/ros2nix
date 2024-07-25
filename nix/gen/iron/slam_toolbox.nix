{
  ament_cmake,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_gtest,
  ament_cmake_uncrustify,
  ament_lint_auto,
  buildRosPackage,
  builtin_interfaces,
  ceres-solver,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive_markers,
  launch,
  launch_testing,
  liblapack,
  message_filters,
  nav2_map_server,
  nav_msgs,
  pluginlib,
  python3Packages,
  qt5,
  rclcpp,
  rosidl_default_generators,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  rviz_rendering,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  suitesparse,
  tbb,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    slam_toolbox = substituteSource {
      src = fetchgit {
        name = "slam_toolbox-source";
        url = "https://github.com/SteveMacenski/slam_toolbox-release.git";
        rev = "78df34baf4188fc1d0a3b6c1e27db9e9f7ff7732";
        hash = "sha256-JcciLjz8SY+gPY6dYJrMEwNi6I3id0FOU+rtVZZJjs0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "slam_toolbox";
  version = "2.7.4-1";
  src = sources.slam_toolbox;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces ceres-solver eigen interactive_markers liblapack message_filters nav2_map_server nav_msgs pluginlib python3Packages.boost qt5.qtbase rclcpp rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering sensor_msgs std_msgs std_srvs suitesparse tbb tf2 tf2_geometry_msgs tf2_ros tf2_sensor_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
