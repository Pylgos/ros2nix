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
  xacro,
}:
let
  sources = rec {
    moveit_resources_prbt_moveit_config = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "9d3d55c82237a47583441415d0f69748ffa0ccf3";
        hash = "sha256-PIPewmh2T1boe+I/jVlC1Weg6gP4O+52b6sazqkllTA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_moveit_config";
  version = "2.10.0-1";
  src = sources.moveit_resources_prbt_moveit_config;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_prbt_ikfast_manipulator_plugin moveit_resources_prbt_support moveit_ros_move_group robot_state_publisher rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
