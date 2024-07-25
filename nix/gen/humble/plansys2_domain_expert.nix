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
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "544bb45457b3ca06a0cfb4e088320f6f7e2dfa50";
        hash = "sha256-3hFJ0/KeAou4FCpsxO5jeiissA+fPNGMbGhQGGWuoLE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_domain_expert";
  version = "2.0.9-1";
  src = sources.plansys2_domain_expert;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs plansys2_core plansys2_msgs plansys2_pddl_parser plansys2_popf_plan_solver rclcpp rclcpp_action rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
