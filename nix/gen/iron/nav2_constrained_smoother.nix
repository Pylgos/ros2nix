{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  ceres-solver,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    nav2_constrained_smoother = substituteSource {
      src = fetchgit {
        name = "nav2_constrained_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b946a2695e3e4f851d20acaf13dcff916c0cbf12";
        hash = "sha256-tvUqepYa/o0FyCFPn9HaEguzHlJCHf5OmtYztn2CJvc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_constrained_smoother";
  version = "1.2.9-1";
  src = sources.nav2_constrained_smoother;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles ceres-solver nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
