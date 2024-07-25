{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  behaviortree_cpp_v3,
  buildRosPackage,
  cppzmq,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  plansys2_core,
  plansys2_domain_expert,
  plansys2_msgs,
  plansys2_pddl_parser,
  plansys2_planner,
  plansys2_problem_expert,
  pluginlib,
  popf,
  rclcpp,
  rclcpp_action,
  rclcpp_cascade_lifecycle,
  rclcpp_lifecycle,
  std_msgs,
  std_srvs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plansys2_executor = substituteSource {
      src = fetchgit {
        name = "plansys2_executor-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "e0723ca2b4c9ff492ebc32338f151d3c712067b3";
        hash = "sha256-VQvuxEPvJPTSJvTYIFJrtceLhFfP3sGlKyCdOf68vXc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_executor";
  version = "2.0.11-1";
  src = sources.plansys2_executor;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ behaviortree_cpp_v3 cppzmq lifecycle_msgs plansys2_core plansys2_domain_expert plansys2_msgs plansys2_pddl_parser plansys2_planner plansys2_problem_expert pluginlib popf rclcpp rclcpp_action rclcpp_cascade_lifecycle rclcpp_lifecycle std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
