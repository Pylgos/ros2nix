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
        rev = "47a53336a95336a52d5612c383ea7a2e3aded447";
        hash = "sha256-XMOuWNh4ByXMgxv3Y0bnnUFGjp7Oi9T5cK4t/RW1vrw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_simple_controller_manager";
  version = "2.8.0-1";
  src = sources.moveit_simple_controller_manager;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs moveit_common moveit_core pluginlib rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
