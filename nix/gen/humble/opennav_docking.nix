{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_graceful_controller,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  opennav_docking_core,
  opennav_docking_msgs,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  sensor_msgs,
  substituteSource,
  tf2_ros,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    opennav_docking = substituteSource {
      src = fetchgit {
        name = "opennav_docking-source";
        url = "https://github.com/open-navigation/opennav_docking-release.git";
        rev = "f20f53a505249d6e11c72478dd39a6c2694d9886";
        hash = "sha256-DgIRsXDpPDDMnNKyAxlTdxXBsQIjPA0lZJOOCFdmUiA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "opennav_docking";
  version = "0.0.2-4";
  src = sources.opennav_docking;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles builtin_interfaces geometry_msgs nav2_graceful_controller nav2_msgs nav2_util nav_msgs opennav_docking_core opennav_docking_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs tf2_ros yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
