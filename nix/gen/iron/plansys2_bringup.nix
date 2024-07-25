{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  plansys2_domain_expert,
  plansys2_executor,
  plansys2_lifecycle_manager,
  plansys2_planner,
  plansys2_problem_expert,
  rclcpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plansys2_bringup = substituteSource {
      src = fetchgit {
        name = "plansys2_bringup-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "a99fcc56f73c30e10618b97645672366cb6d9590";
        hash = "sha256-pXvKnTKSLGS4UWy/0Ak1E+spqnwOM7nHvIAJ3yuuWeU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_bringup";
  version = "2.0.11-1";
  src = sources.plansys2_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros plansys2_domain_expert plansys2_executor plansys2_lifecycle_manager plansys2_planner plansys2_problem_expert rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
