{
  ament_copyright,
  ament_flake8,
  ament_mypy,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  python3Packages,
  substituteSource,
  tracetools_launch,
  tracetools_read,
  tracetools_trace,
}:
let
  sources = rec {
    tracetools_test = substituteSource {
      src = fetchgit {
        name = "tracetools_test-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "85ca7090e899168d37b22382831c8bc21b9d817f";
        hash = "sha256-DzbRzQjnmpHcAbBP/a1xM1mPzG9j7uS/1DG7PJL7ABQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_test";
  version = "6.3.1-1";
  src = sources.tracetools_test;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros tracetools_launch tracetools_read tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
