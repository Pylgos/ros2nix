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
        rev = "ec36cdf23aea940117b32f682a98e83e889cc848";
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
