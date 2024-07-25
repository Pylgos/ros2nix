{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_ros,
  launch_testing,
  message_filters,
  nav2_common,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  sensor_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    nav2_amcl = substituteSource {
      src = fetchgit {
        name = "nav2_amcl-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "0fb56b6cc993e623ee665e448d35516c4cb3720d";
        hash = "sha256-wyKUXgQvZZcIZxm5MYyxVWskGgCqY32h8feVZ0VXXNw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_amcl";
  version = "1.1.15-1";
  src = sources.nav2_amcl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch_testing ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch_ros message_filters nav2_common nav2_msgs nav2_util nav_msgs pluginlib rclcpp sensor_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
