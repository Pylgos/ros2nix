{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rmw_implementation_cmake = substituteSource {
      src = fetchgit {
        name = "rmw_implementation_cmake-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "7cb5e6d4c99aa39f8f5c1ce8bb17181a9d70f8d4";
        hash = "sha256-SsjqEARPzXS5hlxFYz65WHi2CimHarwKOhiWDbfjtZA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_implementation_cmake";
  version = "7.1.0-2";
  src = sources.rmw_implementation_cmake;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
