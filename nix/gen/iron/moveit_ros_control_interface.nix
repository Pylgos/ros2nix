{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  moveit_simple_controller_manager,
  pluginlib,
  rclcpp_action,
  substituteSource,
  trajectory_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_control_interface = substituteSource {
      src = fetchgit {
        name = "moveit_ros_control_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a50c8e4e200040206ef90140387d3ac39e04700f";
        hash = "sha256-yOSiR6BuLNTE6WrmN490fWMrlCa+3s5WRWKBcGCQyf4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_control_interface";
  version = "2.8.0-1";
  src = sources.moveit_ros_control_interface;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager_msgs moveit_common moveit_core moveit_simple_controller_manager pluginlib rclcpp_action trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
