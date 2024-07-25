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
  tracetools_trace,
}:
let
  sources = rec {
    tracetools_launch = substituteSource {
      src = fetchgit {
        name = "tracetools_launch-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "28cb990d6113f76caef05c24de085419cedd19b4";
        hash = "sha256-Bdbc+UqCjEUnzO3oI+u7Wf0bRpxuaoGVSIhpl5mgw20=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_launch";
  version = "4.1.1-1";
  src = sources.tracetools_launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
