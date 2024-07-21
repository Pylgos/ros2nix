{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  orocos_kdl_vendor,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    tf2_eigen_kdl = substituteSource {
      src = fetchgit {
        name = "tf2_eigen_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "4e1452d3f3c580368b58bf60d5ca18eb6582245e";
        hash = "sha256-stCQiwa7ek5lXkoU9tbHpzGhQN2wglHvNDDTozRzUa0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen_kdl";
  version = "0.36.4-1";
  src = sources.tf2_eigen_kdl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen orocos_kdl_vendor tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}