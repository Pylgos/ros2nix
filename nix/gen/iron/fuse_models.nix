{
  ament_cmake_gmock,
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
  fuse_constraints,
  fuse_core,
  fuse_graphs,
  fuse_msgs,
  fuse_publishers,
  fuse_variables,
  gbenchmark,
  geometry_msgs,
  nav_msgs,
  pluginlib,
  python3Packages,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_2d,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    fuse_models = substituteSource {
      src = fetchgit {
        name = "fuse_models-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "c90b2017e52c2a855d330b1ee14669590491b28b";
        hash = "sha256-pfPAICO30j5OBEqbWtvNqrLh168ylJqTqsG5dbH0TA4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_models";
  version = "1.0.1-4";
  src = sources.fuse_models;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver eigen fuse_constraints fuse_core fuse_graphs fuse_msgs fuse_publishers fuse_variables geometry_msgs nav_msgs pluginlib python3Packages.boost rclcpp rclcpp_components sensor_msgs std_srvs tf2 tf2_2d tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
