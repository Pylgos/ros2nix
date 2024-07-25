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
        rev = "a21bf13e4ad7aa305c98a55f3600ed303dbc7ade";
        hash = "sha256-4Y5JBwkTGV53A+JV1WIzLRMyWIEOAcXLHOpL2Os3fdc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_implementation_cmake";
  version = "6.1.2-1";
  src = sources.rmw_implementation_cmake;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
