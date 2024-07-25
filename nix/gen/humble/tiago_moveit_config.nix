{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_pal,
  moveit_configs_utils,
  moveit_kinematics,
  moveit_planners_ompl,
  moveit_ros_control_interface,
  moveit_ros_move_group,
  moveit_ros_perception,
  moveit_ros_visualization,
  substituteSource,
  tiago_description,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    tiago_moveit_config = substituteSource {
      src = fetchgit {
        name = "tiago_moveit_config-source";
        url = "https://github.com/pal-gbp/tiago_moveit_config-release.git";
        rev = "ed4fb3c41cc4f6b70b70bdddf932b514fcd6dcee";
        hash = "sha256-pyx+DlCl4YFyrk6u9XfdBqswYIDvHERjPnr2hSRpMhQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tiago_moveit_config";
  version = "3.0.16-1";
  src = sources.tiago_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_pal moveit_configs_utils moveit_kinematics moveit_planners_ompl moveit_ros_control_interface moveit_ros_move_group moveit_ros_perception moveit_ros_visualization tiago_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
