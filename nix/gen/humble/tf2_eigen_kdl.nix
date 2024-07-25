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
        rev = "b29de9e7107da0570655cd42b701b8b54017a456";
        hash = "sha256-LtEkvSHTXHNFapmCOK79ESqwTeWQedgvZ0qAfSk11q0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen_kdl";
  version = "0.25.7-1";
  src = sources.tf2_eigen_kdl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen orocos_kdl_vendor tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
