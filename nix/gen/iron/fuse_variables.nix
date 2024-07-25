{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_core,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    fuse_variables = substituteSource {
      src = fetchgit {
        name = "fuse_variables-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "a01deb0cb5ef6f2bb73a607963f7a998611d83b3";
        hash = "sha256-QhewMzyrMAEvqM1HI6AZS506y6SpBSipdXaDGakpD0A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_variables";
  version = "1.0.1-4";
  src = sources.fuse_variables;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver fuse_core pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
