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
        rev = "3f39ab5bff2e3aaa0260e1458955ec7d59161dde";
        hash = "sha256-5RfVagC5B13I9MUlku0Z0tShgIXiNMgBsYPQY0RjxSY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_launch";
  version = "6.3.1-1";
  src = sources.tracetools_launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
