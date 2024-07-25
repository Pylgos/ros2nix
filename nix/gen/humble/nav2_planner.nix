{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
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
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_planner = substituteSource {
      src = fetchgit {
        name = "nav2_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "e7534d17ee949a00abe37abae88b0957ce4af873";
        hash = "sha256-OZZbdzuJsRS0Xl3v6pHf/0NVCwcIW352ANvBb5M2pm8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_planner";
  version = "1.1.15-1";
  src = sources.nav2_planner;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
