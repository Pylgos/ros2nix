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
        rev = "e23bc261bf95ea3576604575efe1d181a8604b11";
        hash = "sha256-7rVfGaSRdegLEYEbMFar54pyYcK0vk+KEb9NsEY1Eys=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_control_interface";
  version = "2.5.5-1";
  src = sources.moveit_ros_control_interface;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager_msgs moveit_common moveit_core moveit_simple_controller_manager pluginlib rclcpp_action trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
