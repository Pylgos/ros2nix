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
        rev = "1d5dafd7cf402f4dceee7f4d428bcf92b640c40c";
        hash = "sha256-q985Tc8sV4R+L3jndMhQw6gnkCS5mCir0ZE3rxhz0/w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_runtime";
  version = "2.8.0-1";
  src = sources.moveit_runtime;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_core moveit_planners moveit_plugins moveit_ros_move_group moveit_ros_perception moveit_ros_planning moveit_ros_planning_interface moveit_ros_warehouse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
