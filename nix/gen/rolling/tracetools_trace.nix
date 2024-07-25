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
  lttngpy,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    tracetools_trace = substituteSource {
      src = fetchgit {
        name = "tracetools_trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "a12a5d5caaee4c7b3f55d181cd454eb6d1cca29f";
        hash = "sha256-KZCmvjCEPjh3kzvpMMORH4LyMYxRqLQ4m7HxbLuwwJo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_trace";
  version = "8.3.0-1";
  src = sources.tracetools_trace;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lttngpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}