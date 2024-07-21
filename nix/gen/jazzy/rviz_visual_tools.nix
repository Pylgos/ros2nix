{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  eigen_stl_containers,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  interactive_markers,
  launch,
  launch_ros,
  pluginlib,
  qt5,
  rclcpp,
  rclcpp_components,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  rviz_rendering,
  sensor_msgs,
  shape_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  trajectory_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    rviz_visual_tools = substituteSource {
      src = fetchgit {
        name = "rviz_visual_tools-source";
        url = "https://github.com/ros2-gbp/rviz_visual_tools-release.git";
        rev = "2e05b97387c407ea702931822cc02c3f29dea126";
        hash = "sha256-tVfPKQNpM962nm3D4nPbalanEed98pZ6A4v4ySC79yI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_visual_tools";
  version = "4.1.4-4";
  src = sources.rviz_visual_tools;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python eigen3_cmake_module launch ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ eigen eigen_stl_containers geometry_msgs interactive_markers launch_ros pluginlib qt5.qtbase rclcpp rclcpp_components rviz2 rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering sensor_msgs shape_msgs std_msgs tf2 tf2_eigen tf2_geometry_msgs trajectory_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
