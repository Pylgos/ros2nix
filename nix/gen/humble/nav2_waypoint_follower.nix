{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  nav2_common,
  nav2_core,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    nav2_waypoint_follower = substituteSource {
      src = fetchgit {
        name = "nav2_waypoint_follower-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "1541200337a9a639426c5fa2578afb017882c5ee";
        hash = "sha256-xqWVxHrhSh4dM//y9dVhasPo/pReaNs9cDCPVOdIE7U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_waypoint_follower";
  version = "1.1.15-1";
  src = sources.nav2_waypoint_follower;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport nav2_common nav2_core nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
