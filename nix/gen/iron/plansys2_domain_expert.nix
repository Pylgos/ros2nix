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
  plansys2_msgs,
  plansys2_pddl_parser,
  plansys2_popf_plan_solver,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    plansys2_domain_expert = substituteSource {
      src = fetchgit {
        name = "plansys2_domain_expert-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "093ffbe68795a33375573058f8697cb09e92db19";
        hash = "sha256-Ns0atd5UNuGOznxBgBSGCm3ayI14JsQCZG/FWyiRnCc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_domain_expert";
  version = "2.0.11-1";
  src = sources.plansys2_domain_expert;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs plansys2_core plansys2_msgs plansys2_pddl_parser plansys2_popf_plan_solver rclcpp rclcpp_action rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
