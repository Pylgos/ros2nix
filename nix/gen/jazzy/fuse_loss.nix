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
  libsForQt5,
  pluginlib,
  qt5,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    fuse_loss = substituteSource {
      src = fetchgit {
        name = "fuse_loss-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "0f73e371eac052747faaa867ca413ef08c36d9a4";
        hash = "sha256-euEBZo32VlyBPb2xMuQ1jUISg2Z8v9ftPmATkr1iHOY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_loss";
  version = "1.1.1-1";
  src = sources.fuse_loss;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver fuse_core pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}