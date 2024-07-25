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
  urdf,
  visualization_msgs,
  wrapRosQtAppsHook,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    nav2_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "nav2_rviz_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a8d197a640603bd049c33319f4495cb162581470";
        hash = "sha256-2uNjK+Ta/zsbwjcyB7Emy6XBqtHMCgf4Yz0v82nz9aI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_rviz_plugins";
  version = "1.2.9-1";
  src = sources.nav2_rviz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_lifecycle_manager nav2_msgs nav2_util nav_msgs pluginlib qt5.qtbase rclcpp rclcpp_lifecycle resource_retriever rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering std_msgs tf2_geometry_msgs urdf visualization_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
