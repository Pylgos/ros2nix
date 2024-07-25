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
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "9e65986120b5c7ec6ddc5095e8d005287bb89b3f";
        hash = "sha256-5hVfPvDp3pt2R1doTcMc0xzU+6Adu1YC11LszhntZGA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_bringup";
  version = "2.0.9-1";
  src = sources.plansys2_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros plansys2_domain_expert plansys2_executor plansys2_lifecycle_manager plansys2_planner plansys2_problem_expert rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
