{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  plansys2_domain_expert,
  plansys2_executor,
  plansys2_msgs,
  plansys2_pddl_parser,
  plansys2_planner,
  plansys2_problem_expert,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  readline,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plansys2_terminal = substituteSource {
      src = fetchgit {
        name = "plansys2_terminal-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "2369b0d5e571ed95685ffede0c6048ceae0a477d";
        hash = "sha256-o+WqomMuY6cZdR8aD6UxqoBhs0Ky1JWSC53FeLMsmko=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_terminal";
  version = "2.0.11-1";
  src = sources.plansys2_terminal;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ plansys2_domain_expert plansys2_executor plansys2_msgs plansys2_pddl_parser plansys2_planner plansys2_problem_expert rclcpp rclcpp_action rclcpp_lifecycle readline ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
