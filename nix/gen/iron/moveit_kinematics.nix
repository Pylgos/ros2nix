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
  generate_parameter_library,
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
  rsl,
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
        rev = "d24b714ab645331c263ce522383892f01ca06cd0";
        hash = "sha256-cSx/01hMOSsOvNqPBCCEkaUA8zHwoT+jdbo46pXSSPI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_kinematics";
  version = "2.8.0-1";
  src = sources.moveit_kinematics;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader eigen generate_parameter_library moveit_common moveit_core moveit_msgs moveit_ros_planning orocos_kdl_vendor pluginlib python3Packages.lxml rsl tf2 tf2_kdl urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
