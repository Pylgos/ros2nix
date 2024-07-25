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
  plansys2_msgs,
  plansys2_pddl_parser,
  qt5,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plansys2_problem_expert = substituteSource {
      src = fetchgit {
        name = "plansys2_problem_expert-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "31c3b1bf0d46de5b7988a7a1de3df1586cebf813";
        hash = "sha256-wqWvaR8zT85jowKvU6lzFURs4sSO9UUup/bePFu6/vA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_problem_expert";
  version = "2.0.9-1";
  src = sources.plansys2_problem_expert;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs plansys2_domain_expert plansys2_msgs plansys2_pddl_parser qt5.qtbase rclcpp rclcpp_action rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
