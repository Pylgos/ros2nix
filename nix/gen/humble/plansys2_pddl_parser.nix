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
  plansys2_msgs,
  rclcpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    plansys2_pddl_parser = substituteSource {
      src = fetchgit {
        name = "plansys2_pddl_parser-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "e9d5dbb3a43f07dc0c8a3ee3bef897fd2af1e732";
        hash = "sha256-WSbBpX07RJIpUVgHbCi2stYDooxVmNKDmt2qHg3LBaQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_pddl_parser";
  version = "2.0.9-1";
  src = sources.plansys2_pddl_parser;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ plansys2_msgs rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
