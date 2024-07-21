{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  ros_environment,
  substituteSource,
  webots_ros2_driver,
}:
let
  sources = rec {
    webots_ros2_control = substituteSource {
      src = fetchgit {
        name = "webots_ros2_control-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "4027989472e683b8645318976b4c9b1bc7576a44";
        hash = "sha256-Nrm3WBXZheyRsgEPMJeMYHwXvYmLNTnYc+Ej/MbBm9s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_control";
  version = "2023.1.2-4";
  src = sources.webots_ros2_control;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager hardware_interface pluginlib rclcpp rclcpp_lifecycle webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
