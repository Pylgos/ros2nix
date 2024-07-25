{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  moveit_resources_prbt_ikfast_manipulator_plugin,
  moveit_resources_prbt_support,
  moveit_ros_move_group,
  robot_state_publisher,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    moveit_resources_prbt_moveit_config = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a6b5a21f05b1303ce0d3f06bd271d9d2d5945695";
        hash = "sha256-hXa8qmdZKmKJ0DgRP7WlUSlseFT+SwqoFCGp0N5tNyI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_moveit_config";
  version = "2.8.0-1";
  src = sources.moveit_resources_prbt_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_prbt_ikfast_manipulator_plugin moveit_resources_prbt_support moveit_ros_move_group robot_state_publisher rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
