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
        rev = "3379d156e2e43a76409b0b572d7ba57928e5bd89";
        hash = "sha256-HBhA44JZSdEuPvm6Fz1EkRpOHJ0MlmvjVOkJuT50xQo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_moveit_config";
  version = "2.3.9-1";
  src = sources.ur_moveit_config;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros moveit_kinematics moveit_planners_ompl moveit_ros_move_group moveit_ros_visualization moveit_servo moveit_simple_controller_manager rviz2 ur_description urdf warehouse_ros_sqlite xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
