{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gtest,
  mrpt2,
  ros_environment,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    pose_cov_ops = substituteSource {
      src = fetchgit {
        name = "pose_cov_ops-source";
        url = "https://github.com/ros2-gbp/pose_cov_ops-release.git";
        rev = "48dd9bb4f82429c116b2cf511ad9f6a5650a393e";
        hash = "sha256-dB+me1aSCzx1zSg6mLTc191a3Ur+9zuYbt4JmcnxCcY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pose_cov_ops";
  version = "0.3.11-1";
  src = sources.pose_cov_ops;
  nativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_xmllint geometry_msgs mrpt2 tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}