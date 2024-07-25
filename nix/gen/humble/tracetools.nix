{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    tracetools = substituteSource {
      src = fetchgit {
        name = "tracetools-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "4deec75ffee6d5cf6fa17406be0850ac35896b04";
        hash = "sha256-5yEHJJerQKfeVscgc1q6TKv2aH0xf3KhAcATgLapYnQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools";
  version = "4.1.1-1";
  src = sources.tracetools;
  nativeBuildInputs = [ ament_cmake_ros pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
