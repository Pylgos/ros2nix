{
  ament_cmake,
  ament_cmake_uncrustify,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  qt5,
  rclcpp,
  resource_retriever,
  rmf_door_msgs,
  rmf_lift_msgs,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_visualization_msgs,
  rviz_common,
  rviz_default_plugins,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_visualization_rviz2_plugins = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_rviz2_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "803fe27aa111d634d574997cb31248a24031a3f0";
        hash = "sha256-HzMudKR0IN/ueI4jYuZxlt5Fu87AuFvkt2jj4gqvxuo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_rviz2_plugins";
  version = "2.1.2-1";
  src = sources.rmf_visualization_rviz2_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen pluginlib qt5.qtbase rclcpp resource_retriever rmf_door_msgs rmf_lift_msgs rmf_traffic_ros2 rmf_visualization_msgs rviz_common rviz_default_plugins rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}