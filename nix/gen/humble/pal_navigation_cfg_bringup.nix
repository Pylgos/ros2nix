{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_pal,
  nav2_bringup,
  pal_navigation_cfg_params,
  ros2launch,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pal_navigation_cfg_bringup = substituteSource {
      src = fetchgit {
        name = "pal_navigation_cfg_bringup-source";
        url = "https://github.com/pal-gbp/pal_navigation_cfg_public-release.git";
        rev = "6b3216e2f568f7145ea745ebb73a9a8a2ed3a3e7";
        hash = "sha256-M9h9+zc9Xd3HJ50cgGYL0HK+HY/iFraBFcvBa850D6M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_navigation_cfg_bringup";
  version = "3.0.6-1";
  src = sources.pal_navigation_cfg_bringup;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_pal nav2_bringup pal_navigation_cfg_params ros2launch ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
