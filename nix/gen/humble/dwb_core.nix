{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dwb_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  nav_msgs,
  pluginlib,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    dwb_core = substituteSource {
      src = fetchgit {
        name = "dwb_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "9d99c0737718f79767af9127eb4df875ac392ce4";
        hash = "sha256-GUyCYdGSRU4GvvC+NA+Q3RHpPTkG09TDnmAKs0/J9Cs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_core";
  version = "1.1.15-1";
  src = sources.dwb_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dwb_msgs geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_util nav_2d_msgs nav_2d_utils nav_msgs pluginlib rclcpp sensor_msgs std_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}