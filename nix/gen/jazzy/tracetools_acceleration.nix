{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    tracetools_acceleration = substituteSource {
      src = fetchgit {
        name = "tracetools_acceleration-source";
        url = "https://github.com/ros2-gbp/tracetools_acceleration-release.git";
        rev = "5b343e424887e2d3703364dad8973a5a1c578660";
        hash = "sha256-8S7qrZQ1ohJoEVhAiMPHVKAD4lCTHCfRb1CD5hu4VWg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_acceleration";
  version = "0.4.1-4";
  src = sources.tracetools_acceleration;
  nativeBuildInputs = [ ament_cmake_ros pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
