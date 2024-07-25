{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  plansys2_msgs,
  plansys2_pddl_parser,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    plansys2_core = substituteSource {
      src = fetchgit {
        name = "plansys2_core-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "c68faae9b12ea0ef55d4b8f8f380d58dd25be65d";
        hash = "sha256-gez1CnVwWxREpmf+4BDhBr+c9D6txiXNYKLAF4bm65I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_core";
  version = "2.0.11-1";
  src = sources.plansys2_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ plansys2_msgs plansys2_pddl_parser pluginlib rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
