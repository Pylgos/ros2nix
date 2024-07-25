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
  geometry_msgs,
  launch,
  launch_testing,
  nav2_behavior_tree,
  nav2_common,
  nav2_costmap_2d,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    nav2_core = substituteSource {
      src = fetchgit {
        name = "nav2_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b36ea484cb34ea52191eed5240bd849b1c5088ff";
        hash = "sha256-u5l4YbtuTLvu2WiWGoA8GtSnzNqhZEX4ewahx8VcZhA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_core";
  version = "1.2.9-1";
  src = sources.nav2_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_behavior_tree nav2_common nav2_costmap_2d nav2_util nav_msgs pluginlib rclcpp rclcpp_lifecycle std_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
