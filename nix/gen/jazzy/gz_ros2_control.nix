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
  yaml_cpp_vendor,
}:
let
  sources = rec {
    gz_ros2_control = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "037fafcee3a019a0508853ed47bed46597b0e934";
        hash = "sha256-HS89D2xwT7qUMK1+1ynXhgCwanU1Bhqc9UNgpx6GWDg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_ros2_control";
  version = "1.2.3-1";
  src = sources.gz_ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp controller_manager gz_plugin_vendor gz_sim_vendor hardware_interface pluginlib rclcpp rclcpp_lifecycle yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
