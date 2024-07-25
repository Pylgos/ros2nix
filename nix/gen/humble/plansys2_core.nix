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
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "73b7917736941f7ee2e61c9511e33c6980b3ae3e";
        hash = "sha256-oy9zs0MjcQ6svbFOZgZNi7HHX5YbMy9PC0TikcBITtM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_core";
  version = "2.0.9-1";
  src = sources.plansys2_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ plansys2_msgs plansys2_pddl_parser pluginlib rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
