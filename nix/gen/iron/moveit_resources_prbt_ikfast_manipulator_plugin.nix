{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  moveit_core,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2_eigen,
  tf2_eigen_kdl,
  tf2_geometry_msgs,
  tf2_kdl,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_resources_prbt_ikfast_manipulator_plugin = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_ikfast_manipulator_plugin-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "fd4176991dec8d5d6e34b47f47c9dbb8efa14cbf";
        hash = "sha256-qf8Fn4cxSLfRzHCDRyP1zwiwupWUB01/+cSaXKODZ50=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_ikfast_manipulator_plugin";
  version = "2.8.0-1";
  src = sources.moveit_resources_prbt_ikfast_manipulator_plugin;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ generate_parameter_library moveit_core pluginlib rclcpp tf2_eigen tf2_eigen_kdl tf2_geometry_msgs tf2_kdl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
