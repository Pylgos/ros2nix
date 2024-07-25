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
    gz_ros2_control = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "c2bab610b3f0c29757576437f3f3b71a1858ccf2";
        hash = "sha256-b7b2Xgs/gG4HWoeDWHkQkgR2/4CITQ0hPDVrBC5yJl0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_ros2_control";
  version = "1.1.8-1";
  src = sources.gz_ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager hardware_interface pluginlib rclcpp rclcpp_lifecycle yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
