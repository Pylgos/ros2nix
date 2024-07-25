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
  plansys2_core,
  plansys2_domain_expert,
  plansys2_msgs,
  plansys2_pddl_parser,
  plansys2_popf_plan_solver,
  plansys2_problem_expert,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  ros2run,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plansys2_planner = substituteSource {
      src = fetchgit {
        name = "plansys2_planner-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "27c8f4f30eae72fb7d97f7f9ab45aa992980b341";
        hash = "sha256-PbPVpjL0cbkxJBrEKjHVIXtM5jNywWd4MzVeigPT2hE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_planner";
  version = "2.0.11-1";
  src = sources.plansys2_planner;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs plansys2_core plansys2_domain_expert plansys2_msgs plansys2_pddl_parser plansys2_popf_plan_solver plansys2_problem_expert pluginlib rclcpp rclcpp_action rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
