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
        rev = "7380a742966995d059963f55e4785781313e4039";
        hash = "sha256-vWVUD6v+GQGidrRBIg7yy7CrdHdpjUxJN0wt8eoqMI0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros";
  version = "2.8.0-1";
  src = sources.moveit_ros;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_ros_benchmarks moveit_ros_move_group moveit_ros_planning moveit_ros_planning_interface moveit_ros_robot_interaction moveit_ros_visualization moveit_ros_warehouse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
