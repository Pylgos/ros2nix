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
  popf,
  rclcpp,
  rclcpp_action,
  rclcpp_cascade_lifecycle,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plansys2_executor = substituteSource {
      src = fetchgit {
        name = "plansys2_executor-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "8322361513958237c53de9196f40d36f8be74198";
        hash = "sha256-PIXGUS56KSxVL/xAf8PCwz4A+UAK3BawEWcU5UM3A3s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_executor";
  version = "2.0.9-1";
  src = sources.plansys2_executor;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ behaviortree_cpp_v3 cppzmq lifecycle_msgs plansys2_core plansys2_domain_expert plansys2_msgs plansys2_pddl_parser plansys2_planner plansys2_problem_expert popf rclcpp rclcpp_action rclcpp_cascade_lifecycle rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
