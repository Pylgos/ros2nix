{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_resources_fanuc_moveit_config,
  moveit_resources_panda_moveit_config,
  moveit_ros_move_group,
  moveit_ros_planning,
  moveit_ros_warehouse,
  moveit_simple_controller_manager,
  python3,
  rclcpp,
  rclcpp_action,
  rclpy,
  ros_testing,
  rviz2,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_planning_interface = substituteSource {
      src = fetchgit {
        name = "moveit_ros_planning_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "d2d1e054375fe35cac3fd1c08efcd64a6bc82b66";
        hash = "sha256-LyXQVbAHkCqEPgV96kQUi7a4P4PKxhDCnBlX0igjFGU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_planning_interface";
  version = "2.10.0-1";
  src = sources.moveit_ros_planning_interface;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs moveit_common moveit_core moveit_msgs moveit_ros_move_group moveit_ros_planning moveit_ros_warehouse python3 rclcpp rclcpp_action rclpy tf2 tf2_eigen tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}