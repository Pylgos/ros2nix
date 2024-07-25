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
        rev = "9a44622cc4ed81124e5dfee98e94a6b4d65f5181";
        hash = "sha256-FMTvBYn5jWWe7Azmh4fp+l+HOhOu40WP2vsepD0Px24=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen_kdl";
  version = "0.38.0-1";
  src = sources.tf2_eigen_kdl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen orocos_kdl_vendor tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
