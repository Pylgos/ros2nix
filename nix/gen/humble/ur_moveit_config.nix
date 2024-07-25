{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  moveit_kinematics,
  moveit_planners_ompl,
  moveit_ros_move_group,
  moveit_ros_visualization,
  moveit_servo,
  moveit_simple_controller_manager,
  rviz2,
  substituteSource,
  ur_description,
  urdf,
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
        rev = "fadbe149c934ba207e4ec902ab30cc34c33dbf34";
        hash = "sha256-C3+qxWVZ7oR8NiKUtBOkjqDp2L1tkVekMDWL5O4Hs/0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_moveit_config";
  version = "2.2.14-1";
  src = sources.ur_moveit_config;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros moveit_kinematics moveit_planners_ompl moveit_ros_move_group moveit_ros_visualization moveit_servo moveit_simple_controller_manager rviz2 ur_description urdf warehouse_ros_sqlite xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
