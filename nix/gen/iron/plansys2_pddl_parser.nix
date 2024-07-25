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
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "a47a8f6daebd4d8550d76fe1c66a2926c27d5b27";
        hash = "sha256-J62TRPiHDzKZYRvDrFs4vfmM50uXaE4KfuNF+ted+Ls=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_pddl_parser";
  version = "2.0.11-1";
  src = sources.plansys2_pddl_parser;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ plansys2_msgs rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
