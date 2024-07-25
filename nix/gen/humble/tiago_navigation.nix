{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tiago_2dnav,
  tiago_laser_sensors,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    tiago_navigation = substituteSource {
      src = fetchgit {
        name = "tiago_navigation-source";
        url = "https://github.com/pal-gbp/tiago_navigation-release.git";
        rev = "66ac15181b81ba9b82cee1fcc23341474dd996ab";
        hash = "sha256-ZZoTsTllvMIjRAWK+GAbpiXdngwl1c9WmGlCEi0OnPw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tiago_navigation";
  version = "4.1.1-1";
  src = sources.tiago_navigation;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tiago_2dnav tiago_laser_sensors ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
