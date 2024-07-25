{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_behavior_tree,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    nav2_behaviors = substituteSource {
      src = fetchgit {
        name = "nav2_behaviors-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "2e51076f5a076518c1ef416481f10d0cc4c75876";
        hash = "sha256-R/lgLUgNkLynaCll0ZHoVvGOf7Xx4mDbAVPRrdTnNXI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_behaviors";
  version = "1.1.15-1";
  src = sources.nav2_behaviors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_behavior_tree nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
