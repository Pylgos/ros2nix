{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  omni_base_2dnav,
  omni_base_laser_sensors,
  omni_base_maps,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    omni_base_navigation = substituteSource {
      src = fetchgit {
        name = "omni_base_navigation-source";
        url = "https://github.com/pal-gbp/omni_base_navigation-release.git";
        rev = "8afd08185cac02c3a42758741bc23c764e7a7227";
        hash = "sha256-tC++CZ8dMCTx3R5zRSK4W2WQ+paCbU3OPSeL1c3b+KI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "omni_base_navigation";
  version = "2.0.7-1";
  src = sources.omni_base_navigation;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ omni_base_2dnav omni_base_laser_sensors omni_base_maps ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
