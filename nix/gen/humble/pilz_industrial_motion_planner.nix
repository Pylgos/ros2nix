{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_param_builder,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_resources_panda_moveit_config,
  moveit_resources_prbt_moveit_config,
  moveit_resources_prbt_pg70_support,
  moveit_resources_prbt_support,
  moveit_ros_move_group,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  orocos_kdl_vendor,
  pilz_industrial_motion_planner_testutils,
  pluginlib,
  python3Packages,
  rclcpp,
  ros_testing,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_eigen_kdl,
  tf2_geometry_msgs,
  tf2_kdl,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pilz_industrial_motion_planner = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "1fd3308cfa2767429d243eceffac1db642b1db8a";
        hash = "sha256-ONesqN6YELkhzR+QB5QaDNmphkyo5lpT+3+YhIrIv18=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pilz_industrial_motion_planner";
  version = "2.5.5-1";
  src = sources.pilz_industrial_motion_planner;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs moveit_common moveit_core moveit_msgs moveit_ros_move_group moveit_ros_planning moveit_ros_planning_interface orocos_kdl_vendor pluginlib rclcpp tf2 tf2_eigen tf2_eigen_kdl tf2_geometry_msgs tf2_kdl tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
