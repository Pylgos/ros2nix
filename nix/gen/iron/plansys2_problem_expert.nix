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
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "7b57ecb61dbb6583816d62e390d44a1b8133ad8f";
        hash = "sha256-nkwPquZ6Rv2aFVImoDnFBbzwHwDrFPXvJxNSm34hVlA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_problem_expert";
  version = "2.0.11-1";
  src = sources.plansys2_problem_expert;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs plansys2_domain_expert plansys2_msgs plansys2_pddl_parser qt5.qtbase rclcpp rclcpp_action rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
