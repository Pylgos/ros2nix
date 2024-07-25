{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lttng-tools,
  lttng-ust,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    tracetools = substituteSource {
      src = fetchgit {
        name = "tracetools-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "362371a7b4aad9479194c07e0ef3528124f4ce5e";
        hash = "sha256-bRMxy24KyVQsvPsY4hY+usxTYTbTdpJpDcAm8m5hknk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools";
  version = "6.3.1-1";
  src = sources.tracetools;
  nativeBuildInputs = [ ament_cmake_ros pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lttng-tools lttng-ust ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
