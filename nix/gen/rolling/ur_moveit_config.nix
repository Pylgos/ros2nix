{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_configs_utils,
  moveit_kinematics,
  moveit_planners,
  moveit_planners_chomp,
  moveit_ros_move_group,
  moveit_ros_visualization,
  moveit_servo,
  moveit_simple_controller_manager,
  substituteSource,
  ur_description,
  warehouse_ros_sqlite,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    ur_moveit_config = substituteSource {
      src = fetchgit {
        name = "ur_moveit_config-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "4692aa1716d6122d138b887cb6b9c5adf7ab8028";
        hash = "sha256-qvvhMynDkpSdlYxJ64aBW7mSM+RCGLcVYQgnfyolTqY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_moveit_config";
  version = "2.4.8-1";
  src = sources.ur_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_configs_utils moveit_kinematics moveit_planners moveit_planners_chomp moveit_ros_move_group moveit_ros_visualization moveit_servo moveit_simple_controller_manager ur_description warehouse_ros_sqlite xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
