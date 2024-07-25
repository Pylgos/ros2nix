{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_ros_benchmarks,
  moveit_ros_move_group,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  moveit_ros_robot_interaction,
  moveit_ros_visualization,
  moveit_ros_warehouse,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros = substituteSource {
      src = fetchgit {
        name = "moveit_ros-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7cc6ae3d5a140f180fa434e0f10d47f0d91c17d0";
        hash = "sha256-7uXxXaisjy2WIdiUCQxHlq9KT7FHftzYay7FD46H6MQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros";
  version = "2.5.5-1";
  src = sources.moveit_ros;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_ros_benchmarks moveit_ros_move_group moveit_ros_planning moveit_ros_planning_interface moveit_ros_robot_interaction moveit_ros_visualization moveit_ros_warehouse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
