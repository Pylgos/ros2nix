{
  ament_copyright,
  ament_flake8,
  ament_mypy,
  ament_pep257,
  buildRosPackage,
  caret_analyze,
  caret_msgs,
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
    ros2caret = substituteSource {
      src = fetchgit {
        name = "ros2caret-source";
        url = "https://github.com/ros2-gbp/ros2caret-release.git";
        rev = "f48972ba4ed03749c27bece6eeb6e64e5e4cecec";
        hash = "sha256-0mOrjDB4/Yi4Eo/1VuUfgLqFdPlvtUXKwVax0YjaVIg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2caret";
  version = "0.5.0-6";
  src = sources.ros2caret;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ caret_analyze caret_msgs python3Packages.tabulate ros2cli tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
