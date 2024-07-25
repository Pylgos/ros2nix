{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  chomp_motion_planner,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  pluginlib,
  rclcpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_planners_chomp = substituteSource {
      src = fetchgit {
        name = "moveit_planners_chomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f451078ebab7dd123b0131f41b3edf5333be0dd7";
        hash = "sha256-TTY2xod0AxgsUopBsIkKYqcb3aJU9oOBR2oT+oDA1y4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners_chomp";
  version = "2.8.0-1";
  src = sources.moveit_planners_chomp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ chomp_motion_planner moveit_common moveit_core pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
