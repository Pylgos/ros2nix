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
        rev = "5bcdc0916fd3a74d36ae49c05b791f3b625e7832";
        hash = "sha256-DZuI9uuov5o50kSB6o3sSMd3oWPi9Lak1V2lgL7tl4c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_rviz2_plugins";
  version = "2.0.2-1";
  src = sources.rmf_visualization_rviz2_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen pluginlib qt5.qtbase rclcpp resource_retriever rmf_door_msgs rmf_lift_msgs rmf_traffic_ros2 rmf_visualization_msgs rviz_common rviz_default_plugins rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
