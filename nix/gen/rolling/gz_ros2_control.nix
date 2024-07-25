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
  gz_plugin_vendor,
  gz_sim_vendor,
  hardware_interface,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
  wrapRosQtAppsHook,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    gz_ros2_control = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "8e8957e977ffb9a4d9271a4f9e4d3bb814c5ea8e";
        hash = "sha256-S+8QWz61rh8yrRCFWndFejhm2nUVOFyDS2KqspfsZc0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_ros2_control";
  version = "1.3.1-1";
  src = sources.gz_ros2_control;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp controller_manager gz_plugin_vendor gz_sim_vendor hardware_interface pluginlib rclcpp rclcpp_lifecycle yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
