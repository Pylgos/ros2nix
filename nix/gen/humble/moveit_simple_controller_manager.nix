{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  pluginlib,
  rclcpp,
  rclcpp_action,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_simple_controller_manager = substituteSource {
      src = fetchgit {
        name = "moveit_simple_controller_manager-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5a9d3f2fa1fd720894e56313aff003ea31cb4c7d";
        hash = "sha256-vh8zXs06ZQ/yVs+JwJi2AA2KCe2GtVWub+hdT+jH/q4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_simple_controller_manager";
  version = "2.5.5-1";
  src = sources.moveit_simple_controller_manager;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs moveit_common moveit_core pluginlib rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
