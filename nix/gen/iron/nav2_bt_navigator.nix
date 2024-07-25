{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  behaviortree_cpp_v3,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_behavior_tree,
  nav2_common,
  nav2_core,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    nav2_bt_navigator = substituteSource {
      src = fetchgit {
        name = "nav2_bt_navigator-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "60710b256ad47e8df8038aa48272ad1cab62e1d7";
        hash = "sha256-L9NYQ1C/8P46SVa88CqJEvMtqf5OVicNxp5XFAGb5zo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_bt_navigator";
  version = "1.2.9-1";
  src = sources.nav2_bt_navigator;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ behaviortree_cpp_v3 geometry_msgs nav2_behavior_tree nav2_common nav2_core nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle std_msgs std_srvs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
