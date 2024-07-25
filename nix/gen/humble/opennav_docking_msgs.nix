{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  rosidl_default_generators,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    opennav_docking_msgs = substituteSource {
      src = fetchgit {
        name = "opennav_docking_msgs-source";
        url = "https://github.com/open-navigation/opennav_docking-release.git";
        rev = "14570860bbb1788d2e282429324877b666045f13";
        hash = "sha256-WbENEsNXm9/lcCKkhSdI7Y/1ciQdXY8UepMm2KKpgL0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "opennav_docking_msgs";
  version = "0.0.2-4";
  src = sources.opennav_docking_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav2_msgs nav2_util nav_msgs rclcpp rclcpp_action rclcpp_lifecycle tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
