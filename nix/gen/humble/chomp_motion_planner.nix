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
        rev = "650a68df2cc8750a145079cf391cf7b7f4c3d8ca";
        hash = "sha256-xLvOQPae/FWMuhXYAU8sR36NvV0gh+iLKAd507+xBt0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "chomp_motion_planner";
  version = "2.5.5-1";
  src = sources.chomp_motion_planner;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_common moveit_core rclcpp trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
