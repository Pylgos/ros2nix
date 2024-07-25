{
  ament_cmake,
  ament_cmake_gtest,
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
        rev = "40fa080f9a8de576afdafccf4e7cbc6283641237";
        hash = "sha256-hseesEOBXSfOj36mGIbEmGSddLotrO+orC8BkjQnkzw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_kinematics";
  version = "2.10.0-1";
  src = sources.moveit_kinematics;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader eigen generate_parameter_library moveit_common moveit_core moveit_msgs moveit_ros_planning orocos_kdl_vendor pluginlib python3Packages.lxml rsl tf2 tf2_kdl urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}