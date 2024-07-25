{
  ament_cmake,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  kortex_description,
  moveit_configs_utils,
  moveit_kinematics,
  moveit_planners,
  moveit_ros_move_group,
  moveit_ros_visualization,
  moveit_ros_warehouse,
  moveit_setup_assistant,
  moveit_simple_controller_manager,
  picknik_reset_fault_controller,
  picknik_twist_controller,
  robot_state_publisher,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    kinova_gen3_6dof_robotiq_2f_85_moveit_config = substituteSource {
      src = fetchgit {
        name = "kinova_gen3_6dof_robotiq_2f_85_moveit_config-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "a11c1f8b01d672ea55553275e5e386f663ab0c40";
        hash = "sha256-9CNjT91s8BP6jCVjUKgia6mjRUPVRuszO8R/fBh7vnU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kinova_gen3_6dof_robotiq_2f_85_moveit_config";
  version = "0.2.2-1";
  src = sources.kinova_gen3_6dof_robotiq_2f_85_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager joint_state_publisher joint_state_publisher_gui kortex_description moveit_configs_utils moveit_kinematics moveit_planners moveit_ros_move_group moveit_ros_visualization moveit_ros_warehouse moveit_setup_assistant moveit_simple_controller_manager picknik_reset_fault_controller picknik_twist_controller robot_state_publisher rviz2 rviz_common rviz_default_plugins tf2_ros xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}