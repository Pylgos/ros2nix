{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geodesy,
  geographic_msgs,
  substituteSource,
}:
let
  sources = rec {
    geographic_info = substituteSource {
      src = fetchgit {
        name = "geographic_info-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "35692f39c3409a3c8f7f5a0cd45a8122bfcebe00";
        hash = "sha256-9v0PhFwY4GRy9FH7XCYu+48GcNisf9Hg2093eaFWEKU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geographic_info";
  version = "1.0.6-1";
  src = sources.geographic_info;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geodesy geographic_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
