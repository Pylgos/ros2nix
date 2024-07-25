{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  behaviortree_cpp_v3,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_behavior_tree,
  nav2_core,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  opennav_docking_msgs,
  rclcpp,
  rclcpp_action,
  substituteSource,
}:
let
  sources = rec {
    opennav_docking_bt = substituteSource {
      src = fetchgit {
        name = "opennav_docking_bt-source";
        url = "https://github.com/open-navigation/opennav_docking-release.git";
        rev = "7da9878e7c29c66bb9a7d9287b1b5397d4f61607";
        hash = "sha256-UuMxqgsNYV0bgZICYMWVxNUE9GFB5sL5VU9+qfu/zww=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "opennav_docking_bt";
  version = "0.0.2-4";
  src = sources.opennav_docking_bt;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ behaviortree_cpp_v3 geometry_msgs nav2_behavior_tree nav2_core nav2_msgs nav2_util nav_msgs opennav_docking_msgs rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
