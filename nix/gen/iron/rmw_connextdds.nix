{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rmw_connextdds_common,
  substituteSource,
}:
let
  sources = rec {
    rmw_connextdds = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "29c4cfbd4aceb8f7b381d9ad1e892cdb9bd5da9b";
        hash = "sha256-FXTd7BxSgdLQ1XAEHctZDi/gq1hW82QG8whN+9KGMIs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_connextdds";
  version = "0.14.1-1";
  src = sources.rmw_connextdds;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rmw_connextdds_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
