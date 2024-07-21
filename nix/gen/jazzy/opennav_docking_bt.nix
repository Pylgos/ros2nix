{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  behaviortree_cpp,
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
  rclcpp,
  rclcpp_action,
  substituteSource,
}:
let
  sources = rec {
    opennav_docking_bt = substituteSource {
      src = fetchgit {
        name = "opennav_docking_bt-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "249530b0b54e64bd792e009da5240b952c2b8e22";
        hash = "sha256-foF7uopSkMczIRyZn4+9vEex97H3rI5gOPuUJbnr6E4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "opennav_docking_bt";
  version = "1.3.1-1";
  src = sources.opennav_docking_bt;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ behaviortree_cpp geometry_msgs nav2_behavior_tree nav2_core nav2_msgs nav2_util nav_msgs rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}