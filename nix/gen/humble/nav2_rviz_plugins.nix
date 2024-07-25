{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_lifecycle_manager,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  qt5,
  rclcpp,
  rclcpp_lifecycle,
  resource_retriever,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  rviz_rendering,
  std_msgs,
  substituteSource,
  tf2_geometry_msgs,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    nav2_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "nav2_rviz_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a7f8ecf44eaafcf99e6fafb2eac0647d285eaa8f";
        hash = "sha256-xpTo8wrTEJlQlymkx6jxSlPmvmiukwZY7g5ajG95jyw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_rviz_plugins";
  version = "1.1.15-1";
  src = sources.nav2_rviz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_lifecycle_manager nav2_msgs nav2_util nav_msgs pluginlib qt5.qtbase rclcpp rclcpp_lifecycle resource_retriever rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering std_msgs tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
