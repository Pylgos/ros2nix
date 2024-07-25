{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_core,
  moveit_planners,
  moveit_plugins,
  moveit_ros_move_group,
  moveit_ros_perception,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  moveit_ros_warehouse,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_runtime = substituteSource {
      src = fetchgit {
        name = "moveit_runtime-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "6a1c4415a0b70c003a0fd4953add50788437d265";
        hash = "sha256-br2mOHeRmLXzrncvJ0Uyh001nJOXhndt+LYX96/mW18=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_runtime";
  version = "2.5.5-1";
  src = sources.moveit_runtime;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_core moveit_planners moveit_plugins moveit_ros_move_group moveit_ros_perception moveit_ros_planning moveit_ros_planning_interface moveit_ros_warehouse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
