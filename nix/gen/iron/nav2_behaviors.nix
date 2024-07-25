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
        rev = "fba2d1214b769e24acc6421f8383e16d882edeb6";
        hash = "sha256-4OCde3f9XPPb9mWxjFbJWviUh5DS3Q5qkdQoMQ38soA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_behaviors";
  version = "1.2.9-1";
  src = sources.nav2_behaviors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_behavior_tree nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
