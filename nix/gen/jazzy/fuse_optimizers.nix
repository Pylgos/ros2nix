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
        rev = "cfabad7a430ea1c75b98f294edddf5dd4679e1c6";
        hash = "sha256-dabQsl6P+3hhZYHysGHSSw3bSnbLe+0tgaMNcYyu6kY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_optimizers";
  version = "1.1.1-1";
  src = sources.fuse_optimizers;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver diagnostic_updater eigen fuse_constraints fuse_core fuse_graphs fuse_msgs fuse_variables pluginlib python3Packages.boost rclcpp rclcpp_components std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
