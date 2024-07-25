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
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse_loss = substituteSource {
      src = fetchgit {
        name = "fuse_loss-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "e9b0389403467303dc2c01c7be3d457d541f22c5";
        hash = "sha256-Caq7DLAM56t97ln1vu2f5/JsGWLMGANUbrNPwUkwXug=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_loss";
  version = "1.0.1-4";
  src = sources.fuse_loss;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver fuse_core pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
