{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_param_builder,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_resources_fanuc_description,
  moveit_resources_fanuc_moveit_config,
  moveit_resources_panda_description,
  moveit_resources_panda_moveit_config,
  moveit_ros_planning,
  orocos_kdl_vendor,
  pluginlib,
  python3Packages,
  ros_testing,
  substituteSource,
  tf2,
  tf2_kdl,
  urdfdom,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_kinematics = substituteSource {
      src = fetchgit {
        name = "moveit_kinematics-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "63e016b34c0720228212e12aed0acfce5217d802";
        hash = "sha256-+QK4eSz/RqcOi8LLkqOPY9X1g9PpSZ/8URm7xYRqCrY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_kinematics";
  version = "2.5.5-1";
  src = sources.moveit_kinematics;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader eigen moveit_common moveit_core moveit_msgs orocos_kdl_vendor pluginlib python3Packages.lxml tf2 tf2_kdl urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
