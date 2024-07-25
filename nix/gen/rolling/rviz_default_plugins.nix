{
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_index_cpp,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gz_math_vendor,
  image_transport,
  interactive_markers,
  laser_geometry,
  map_msgs,
  nav_msgs,
  pluginlib,
  point_cloud_transport,
  qt5,
  rclcpp,
  resource_retriever,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  rviz_rendering_tests,
  rviz_visual_testing_framework,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  urdf,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_default_plugins = substituteSource {
      src = fetchgit {
        name = "rviz_default_plugins-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "479c8679fdda168768e7295ce9c1d0528e78b1bc";
        hash = "sha256-JRDG3PH9hooEEbBmJ/lKkBUJG+Yydy1T2f1BbTOX61s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_default_plugins";
  version = "14.2.3-1";
  src = sources.rviz_default_plugins;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs gz_math_vendor image_transport interactive_markers laser_geometry map_msgs nav_msgs pluginlib point_cloud_transport qt5.qtbase rclcpp resource_retriever rviz_common rviz_ogre_vendor rviz_rendering tf2 tf2_geometry_msgs tf2_ros urdf visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
