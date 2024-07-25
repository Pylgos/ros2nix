{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  diagnostic_updater,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_graphs,
  fuse_models,
  fuse_msgs,
  fuse_variables,
  geometry_msgs,
  launch,
  launch_pytest,
  launch_ros,
  nav_msgs,
  pluginlib,
  python3Packages,
  rclcpp,
  rclcpp_components,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    fuse_optimizers = substituteSource {
      src = fetchgit {
        name = "fuse_optimizers-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "50051cb9d007839b10a2b1418a1713454b8f21ee";
        hash = "sha256-bw5zALaX+B5HpkGEK5/LLqWjVbQbIBzDNGsTYevpOJ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_optimizers";
  version = "1.0.1-4";
  src = sources.fuse_optimizers;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver diagnostic_updater eigen fuse_constraints fuse_core fuse_graphs fuse_msgs fuse_variables pluginlib python3Packages.boost rclcpp rclcpp_components std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
