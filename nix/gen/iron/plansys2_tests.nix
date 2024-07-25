{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  behaviortree_cpp_v3,
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
  popf,
  rclcpp,
  rclcpp_action,
  rclcpp_cascade_lifecycle,
  rclcpp_lifecycle,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plansys2_tests = substituteSource {
      src = fetchgit {
        name = "plansys2_tests-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "c87c6e92b93cf7b60892cd769beb8c02cc94572d";
        hash = "sha256-Hk4DaDairxXTRO4KzbLsps7Ncu6xORkWovGv8b886Ps=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_tests";
  version = "2.0.11-1";
  src = sources.plansys2_tests;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ behaviortree_cpp_v3 lifecycle_msgs plansys2_domain_expert plansys2_executor plansys2_msgs plansys2_pddl_parser plansys2_planner plansys2_problem_expert popf rclcpp rclcpp_action rclcpp_cascade_lifecycle rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
