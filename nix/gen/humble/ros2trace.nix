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
  python3Packages,
  ros2cli,
  substituteSource,
  tracetools_trace,
}:
let
  sources = rec {
    ros2trace = substituteSource {
      src = fetchgit {
        name = "ros2trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "6fa3a4551266ed2ef05e862dcd1f392e7847bca2";
        hash = "sha256-NUrR9x2Cum2Cq1ZleWr+iFVOlRKghvuR5RRy7m3soQQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2trace";
  version = "4.1.1-1";
  src = sources.ros2trace;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
