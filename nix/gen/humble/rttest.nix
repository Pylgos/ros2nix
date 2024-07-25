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
        rev = "ceedc6769ac4ce59c19669c403db6588d5bae69a";
        hash = "sha256-PC9D2ZP/+d4cJp4oF8oJtElhBMMJCsXsSidVy22Rfwo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rttest";
  version = "0.13.0-2";
  src = sources.rttest;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
