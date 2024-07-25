{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rttest = substituteSource {
      src = fetchgit {
        name = "rttest-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "2d12a9943e4600fb54b2e6d758e7b3d5fb409bd8";
        hash = "sha256-iAema0Hi6be1XU2kJq/z0esUS1U8iwqMRBctoSUp1xI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rttest";
  version = "0.18.0-1";
  src = sources.rttest;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
