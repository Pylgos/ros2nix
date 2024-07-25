{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pmb2_2dnav,
  pmb2_laser_sensors,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pmb2_navigation = substituteSource {
      src = fetchgit {
        name = "pmb2_navigation-source";
        url = "https://github.com/pal-gbp/pmb2_navigation-gbp.git";
        rev = "13b520c8bca59be8e69f8c9f1a94476e1fc2b25d";
        hash = "sha256-lTuUqUW/qv1vRSqHkDzwTHHN9tz7Y4WUMxNx0TKJfcA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pmb2_navigation";
  version = "4.0.21-1";
  src = sources.pmb2_navigation;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pmb2_2dnav pmb2_laser_sensors ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
