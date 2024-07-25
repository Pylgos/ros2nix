{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pal_navigation_cfg_bringup,
  pal_navigation_cfg_params,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pal_navigation_cfg = substituteSource {
      src = fetchgit {
        name = "pal_navigation_cfg-source";
        url = "https://github.com/pal-gbp/pal_navigation_cfg_public-release.git";
        rev = "8f86042849801f74a2b0afb84e0e1d6b09ded4a3";
        hash = "sha256-/qdP/jy709cA4ZlGnWnvDUZ7aNmPojRxPm1i5rLPAPA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_navigation_cfg";
  version = "3.0.6-1";
  src = sources.pal_navigation_cfg;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pal_navigation_cfg_bringup pal_navigation_cfg_params ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
