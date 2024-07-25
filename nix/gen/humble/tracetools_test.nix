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
        rev = "a2e7bdc0708f67a32efaf2e32f069eeb7976d12e";
        hash = "sha256-8nCkrsV/VFYy1st5spOxIpYzsa3Iq2oFGNz/Rj5a61o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_test";
  version = "4.1.1-1";
  src = sources.tracetools_test;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros tracetools_launch tracetools_read tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
