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
        rev = "1a5a157accfbdd103f464327319c39f2b2ff4337";
        hash = "sha256-JwS3IQfZ3EKJgzZODR0CuinuyO7AZSh2U3bM06lnATA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_connextdds";
  version = "0.11.2-1";
  src = sources.rmw_connextdds;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rmw_connextdds_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
