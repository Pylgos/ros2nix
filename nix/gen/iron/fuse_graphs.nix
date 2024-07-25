{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_core,
  gbenchmark,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    fuse_graphs = substituteSource {
      src = fetchgit {
        name = "fuse_graphs-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d988abee46272d06c81e5bc2dace3428e698641b";
        hash = "sha256-kbMWbwjEINWa38+gVJ1l1S9WvFXenJSNEyQAjkyiWLY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_graphs";
  version = "1.0.1-4";
  src = sources.fuse_graphs;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver fuse_core pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
