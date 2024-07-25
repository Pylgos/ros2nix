{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
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
        rev = "486fc02d81127b43b1ee24abb539e742458dd982";
        hash = "sha256-xoXukfuBXUzVY0X/2RHTDXrfEguOhOW+gLlVHHxi76Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pilz_industrial_motion_planner";
  version = "2.10.0-1";
  src = sources.pilz_industrial_motion_planner;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ generate_parameter_library geometry_msgs moveit_common moveit_core moveit_msgs moveit_ros_move_group moveit_ros_planning orocos_kdl_vendor pluginlib rclcpp tf2 tf2_eigen tf2_eigen_kdl tf2_geometry_msgs tf2_kdl tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}