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
  lttng-tools,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    tracetools_trace = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "c15e663362bba2a9ae8a0a426efff37178b3f668";
        hash = "sha256-7wpytC7i8n8PUdWuN7QObF13aw/zPMvYhZPOO8N2x78=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_trace";
  version = "6.3.1-1";
  src = sources.tracetools_trace;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lttng-tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
