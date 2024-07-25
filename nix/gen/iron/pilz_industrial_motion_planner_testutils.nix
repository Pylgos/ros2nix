{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  moveit_msgs,
  rclcpp,
  substituteSource,
  tf2_eigen,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pilz_industrial_motion_planner_testutils = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner_testutils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0631771bf039791511853ac6357501dfa8e9d14c";
        hash = "sha256-z2A3A5//QRAQUwHVDl9P7AF0g6LQoSXqC9ktFh9MFzk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pilz_industrial_motion_planner_testutils";
  version = "2.8.0-1";
  src = sources.pilz_industrial_motion_planner_testutils;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_common moveit_core moveit_msgs rclcpp tf2_eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
