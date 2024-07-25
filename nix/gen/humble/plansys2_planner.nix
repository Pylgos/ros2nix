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
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "e4dc0e3b25f8212be3dcf7cc52a0cb8979b9f898";
        hash = "sha256-/MFdbCG+U9shPC5/IipaM6Cn44x4PvsuaLcthGMA/1w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_planner";
  version = "2.0.9-1";
  src = sources.plansys2_planner;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs plansys2_core plansys2_domain_expert plansys2_msgs plansys2_pddl_parser plansys2_popf_plan_solver plansys2_problem_expert pluginlib rclcpp rclcpp_action rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
