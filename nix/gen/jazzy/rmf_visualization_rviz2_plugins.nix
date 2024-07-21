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
}:
let
  sources = rec {
    rmf_visualization_rviz2_plugins = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_rviz2_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "6a446a8b53432f788570fd1d75e5004fc5d784a2";
        hash = "sha256-JW8h27nDnZY7HFklphMYJCP/FARy5JqLWMrGFx5R2wY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_rviz2_plugins";
  version = "2.3.2-1";
  src = sources.rmf_visualization_rviz2_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ eigen qt5.qtbase ];
  propagatedBuildInputs = [ pluginlib qt5.qtbase rclcpp resource_retriever rmf_door_msgs rmf_lift_msgs rmf_traffic_ros2 rmf_visualization_msgs rviz_common rviz_default_plugins rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
