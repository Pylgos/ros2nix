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
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "6c79d24663f355ec1445cfc1f740b6b14d57a1f8";
        hash = "sha256-kTsMyB2o0CoxgSWXDnvkF10ji8Dipg3StaETEuuXdJk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_popf_plan_solver";
  version = "2.0.11-1";
  src = sources.plansys2_popf_plan_solver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ plansys2_core pluginlib popf rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
