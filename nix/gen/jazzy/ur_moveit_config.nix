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
        rev = "50c38db50f33d86848e7b5b2dbe38471e25e6fe6";
        hash = "sha256-f3ffejf/CzZA1EqEYcgnnrN23i/ElOlHlxkOivSNnMA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_moveit_config";
  version = "2.4.5-1";
  src = sources.ur_moveit_config;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros moveit_kinematics moveit_planners_ompl moveit_ros_move_group moveit_ros_visualization moveit_servo moveit_simple_controller_manager rviz2 ur_description urdf warehouse_ros_sqlite xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
