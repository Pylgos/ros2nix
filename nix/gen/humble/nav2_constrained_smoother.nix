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
        rev = "33e178e312e9d607b0e182785565ca8173fdf706";
        hash = "sha256-mRrgKJkJDWOfRS/JqZznOqKUcPDL3JgudjS3pMPiv/0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_constrained_smoother";
  version = "1.1.15-1";
  src = sources.nav2_constrained_smoother;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles ceres-solver nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
