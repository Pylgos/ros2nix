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
        rev = "63b1171c519d91f33d10602b1557805934f01ae4";
        hash = "sha256-KVxOQXiJZ8q4uT7bcjN45otXyLFzw7YcHRN4z/Ng0kY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners_chomp";
  version = "2.5.5-1";
  src = sources.moveit_planners_chomp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ chomp_motion_planner moveit_common moveit_core pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
