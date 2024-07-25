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
        rev = "74ac9eefaed84bb013f2287b2231fae47014588d";
        hash = "sha256-NFo5jirRNAAAgNgpSgZ0SW1TqPa3qkScGIF4hXh7HGI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_implementation_cmake";
  version = "7.4.1-1";
  src = sources.rmw_implementation_cmake;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
