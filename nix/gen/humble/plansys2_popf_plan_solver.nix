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
  plansys2_core,
  pluginlib,
  popf,
  rclcpp,
  ros2run,
  substituteSource,
}:
let
  sources = rec {
    plansys2_popf_plan_solver = substituteSource {
      src = fetchgit {
        name = "plansys2_popf_plan_solver-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "a8e83668182da5ae95fbbc18e23b55dbed161c21";
        hash = "sha256-JNKrxUKjBX0T0F/FWBwomH8ZHSyZfCvo8iz3OTJ0nYw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_popf_plan_solver";
  version = "2.0.9-1";
  src = sources.plansys2_popf_plan_solver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ plansys2_core pluginlib popf rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
