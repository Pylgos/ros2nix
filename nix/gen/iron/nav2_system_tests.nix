{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_ros_pkgs,
  geometry_msgs,
  launch,
  launch_ros,
  launch_testing,
  lcov,
  nav2_amcl,
  nav2_behavior_tree,
  nav2_bringup,
  nav2_common,
  nav2_lifecycle_manager,
  nav2_map_server,
  nav2_msgs,
  nav2_navfn_planner,
  nav2_planner,
  nav2_util,
  nav_msgs,
  navigation2,
  python3Packages,
  rclcpp,
  rclpy,
  robot_state_publisher,
  std_msgs,
  substituteSource,
  tf2_geometry_msgs,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    nav2_system_tests = substituteSource {
      src = fetchgit {
        name = "nav2_system_tests-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "39f1ef728fdb958cd58f05b564d0f75a91bec4b2";
        hash = "sha256-QqQLPGXBbpOgBddlrmd69LZq3LAGUB4KChvgKeTSUCc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_system_tests";
  version = "1.2.9-1";
  src = sources.nav2_system_tests;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch_testing lcov ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_ros_pkgs geometry_msgs launch_ros nav2_amcl nav2_behavior_tree nav2_bringup nav2_common nav2_lifecycle_manager nav2_map_server nav2_msgs nav2_navfn_planner nav2_planner nav2_util nav_msgs navigation2 rclcpp rclpy robot_state_publisher std_msgs tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
