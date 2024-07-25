{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_core,
  fuse_graphs,
  fuse_variables,
  gbenchmark,
  geometry_msgs,
  pluginlib,
  rclcpp,
  substituteSource,
  suitesparse,
}:
let
  sources = rec {
    fuse_constraints = substituteSource {
      src = fetchgit {
        name = "fuse_constraints-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "bbaa2fc5d8ba04e65b129cabdf99c858415d42ff";
        hash = "sha256-7xDUrkClDtqtyUCxoDEfh/l9KU/Ot6ezhVaONP595TY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_constraints";
  version = "1.0.1-4";
  src = sources.fuse_constraints;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver eigen fuse_core fuse_graphs fuse_variables geometry_msgs pluginlib rclcpp suitesparse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
