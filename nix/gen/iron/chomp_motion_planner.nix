{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  rclcpp,
  rsl,
  substituteSource,
  trajectory_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    chomp_motion_planner = substituteSource {
      src = fetchgit {
        name = "chomp_motion_planner-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "fbbfa7b24f057fb74a96cadb866a0bb9b15f1bd8";
        hash = "sha256-R6vwnfSBfdQ8/uLi6/ghClJwkQkCoUgK/xY9Rfw/xlU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "chomp_motion_planner";
  version = "2.8.0-1";
  src = sources.chomp_motion_planner;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_common moveit_core rclcpp rsl trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
