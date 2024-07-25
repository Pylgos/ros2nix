{
  ament_cmake_auto,
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
    tiago_laser_sensors = substituteSource {
      src = fetchgit {
        name = "tiago_laser_sensors-source";
        url = "https://github.com/pal-gbp/tiago_navigation-release.git";
        rev = "f217b3875e27d800c04badd8a6af820abab3b75c";
        hash = "sha256-z9Cq9KqYVdwc9fScMcr67TVc6ePXRsR9ry2N7lFcQ24=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tiago_laser_sensors";
  version = "4.1.1-1";
  src = sources.tiago_laser_sensors;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
