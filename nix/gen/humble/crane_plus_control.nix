{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager,
  crane_plus_description,
  dynamixel_sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  rclcpp,
  ros2_controllers,
  ros2controlcli,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    crane_plus_control = substituteSource {
      src = fetchgit {
        name = "crane_plus_control-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "222de197c24a2e13e6870bd98c49bff12cbe5bea";
        hash = "sha256-/RrA61xwkzMQyFJ/1nu2kjKwCb8dqwKaK5dvnt0k9xQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "crane_plus_control";
  version = "2.0.1-1";
  src = sources.crane_plus_control;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager crane_plus_description dynamixel_sdk hardware_interface pluginlib rclcpp ros2_controllers ros2controlcli xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
