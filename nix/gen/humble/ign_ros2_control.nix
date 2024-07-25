{
  ament_cmake,
  ament_index_cpp,
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
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    ign_ros2_control = substituteSource {
      src = fetchgit {
        name = "ign_ros2_control-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "87901210520dd7fb3938cc770855f87bf60a6642";
        hash = "sha256-tqqf/g4wGv0ktbOWovD8+ewNkyRpyTMQWPP1xuf+KbI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ign_ros2_control";
  version = "0.7.9-1";
  src = sources.ign_ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager hardware_interface pluginlib rclcpp rclcpp_lifecycle yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
