{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_index_cpp,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ignition_math6_vendor,
  image_transport,
  interactive_markers,
  laser_geometry,
  map_msgs,
  nav_msgs,
  pluginlib,
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
        rev = "84e4c064c523eb55a65c4822c8148cb5fd0b54f3";
        hash = "sha256-Qp67kwvABcrdb+nFb4RhaazEehcqPamWS73OgOwHD38=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_default_plugins";
  version = "11.2.12-1";
  src = sources.rviz_default_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs ignition_math6_vendor image_transport interactive_markers laser_geometry map_msgs nav_msgs pluginlib qt5.qtbase rclcpp resource_retriever rviz_common rviz_ogre_vendor rviz_rendering tf2 tf2_geometry_msgs tf2_ros urdf visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
