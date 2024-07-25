{
  ament_cmake,
  buildRosPackage,
  clearpath_config_live,
  clearpath_platform_msgs,
  clearpath_viz,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    clearpath_desktop = substituteSource {
      src = fetchgit {
        name = "clearpath_desktop-source";
        url = "https://github.com/clearpath-gbp/clearpath_desktop-release.git";
        rev = "440e4170c1d9bb5c710b209c93f5fab68d1d7100";
        hash = "sha256-WFDOo9aHP28+KtTmlLkVtjccqBSco+6A8cRINMZvEW0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_desktop";
  version = "0.1.2-1";
  src = sources.clearpath_desktop;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_config_live clearpath_platform_msgs clearpath_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
