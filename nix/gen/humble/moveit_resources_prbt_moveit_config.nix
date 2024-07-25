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
        rev = "67ce85f59a4113ae6c2bda0d72bda9be021de29b";
        hash = "sha256-dxMBSMijuGFjW48PtqNTRCH/8HtsRMEo4HpQVn5CsJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_moveit_config";
  version = "2.5.5-1";
  src = sources.moveit_resources_prbt_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_prbt_ikfast_manipulator_plugin moveit_resources_prbt_support moveit_ros_move_group robot_state_publisher rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
