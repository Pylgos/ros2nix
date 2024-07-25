{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_models,
  fuse_optimizers,
  fuse_publishers,
  fuse_variables,
  nav_msgs,
  rclcpp,
  rviz2,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse_tutorials = substituteSource {
      src = fetchgit {
        name = "fuse_tutorials-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "0ceec1a82da5bf565f0be20056b8bd24400c0650";
        hash = "sha256-uPbrXJVRHUvulp4aNNzJCFX2sy9q1L0IlNwzf7Eei+M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_tutorials";
  version = "1.0.1-4";
  src = sources.fuse_tutorials;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fuse_constraints fuse_core fuse_models fuse_optimizers fuse_publishers fuse_variables nav_msgs rclcpp rviz2 sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
