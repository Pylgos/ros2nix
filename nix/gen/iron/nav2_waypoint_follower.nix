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
  geographic_msgs,
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
  robot_localization,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    nav2_waypoint_follower = substituteSource {
      src = fetchgit {
        name = "nav2_waypoint_follower-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "f0fffd256eecaad28945648403d273277e27fc2c";
        hash = "sha256-rWDpqIFrKRGXCTZANFRxttti3Dnmw7pc1upr/jvvQRU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_waypoint_follower";
  version = "1.2.9-1";
  src = sources.nav2_waypoint_follower;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geographic_msgs image_transport nav2_common nav2_core nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle robot_localization tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
