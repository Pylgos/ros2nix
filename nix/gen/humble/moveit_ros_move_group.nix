{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  moveit_kinematics,
  moveit_resources_fanuc_moveit_config,
  moveit_ros_occupancy_map_monitor,
  moveit_ros_planning,
  pluginlib,
  rclcpp,
  rclcpp_action,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_move_group = substituteSource {
      src = fetchgit {
        name = "moveit_ros_move_group-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0ebc02e14085347d0240d45c0929149e2dfb3b6c";
        hash = "sha256-lLbgtT73NxuPhUiMZGVEBWHZiZID9eL7NpFGQieWbFc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_move_group";
  version = "2.5.5-1";
  src = sources.moveit_ros_move_group;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_common moveit_core moveit_kinematics moveit_ros_occupancy_map_monitor moveit_ros_planning pluginlib rclcpp rclcpp_action std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
