{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
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
        rev = "d0a8e5ca2c7975ca4f6b56614d91466784f9712a";
        hash = "sha256-jhdmXR3C81eObbnSU7b/srrGwYHMJJBCZqdjkOVt62M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_move_group";
  version = "2.8.0-1";
  src = sources.moveit_ros_move_group;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmt moveit_common moveit_core moveit_kinematics moveit_ros_occupancy_map_monitor moveit_ros_planning pluginlib rclcpp rclcpp_action std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
