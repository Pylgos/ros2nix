{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    nav2_theta_star_planner = substituteSource {
      src = fetchgit {
        name = "nav2_theta_star_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "7fff9172cd986e1bd56457c7fd16f51646286cb9";
        hash = "sha256-STvd7YlASz5QuThBX6lkd5CEeGauN/eMavz65g4q2gU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_theta_star_planner";
  version = "1.1.15-1";
  src = sources.nav2_theta_star_planner;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
