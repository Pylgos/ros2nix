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
  tracetools_analysis,
}:
let
  sources = rec {
    ros2trace_analysis = substituteSource {
      src = fetchgit {
        name = "ros2trace_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "73f8e772a2669386d834c315f61efa167cd0ff5e";
        hash = "sha256-88nEQ39lxqn4A5k9lH63DZqI0nV7umn2QUpbOCQyVpE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2trace_analysis";
  version = "3.0.0-5";
  src = sources.ros2trace_analysis;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli tracetools_analysis ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
