{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  moveit_kinematics,
  moveit_planners,
  moveit_ros_move_group,
  moveit_ros_visualization,
  moveit_ros_warehouse,
  moveit_simple_controller_manager,
  robot_state_publisher,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  srdfdom,
  substituteSource,
  tf2_ros,
  turtlebot3_manipulation_description,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    turtlebot3_manipulation_moveit_config = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_moveit_config-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "f4bc3a8c8ea57157a17fb8bf713044a11024eea1";
        hash = "sha256-9crihTmSQHX3oR4nI3s0tfKEldHxRBVgam7PZqthIGM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_manipulation_moveit_config";
  version = "2.1.1-1";
  src = sources.turtlebot3_manipulation_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui moveit_kinematics moveit_planners moveit_ros_move_group moveit_ros_visualization moveit_ros_warehouse moveit_simple_controller_manager robot_state_publisher rviz2 rviz_common rviz_default_plugins srdfdom tf2_ros turtlebot3_manipulation_description xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
