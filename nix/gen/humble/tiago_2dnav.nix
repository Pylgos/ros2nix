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
  pal_maps,
  ros2launch,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    tiago_2dnav = substituteSource {
      src = fetchgit {
        name = "tiago_2dnav-source";
        url = "https://github.com/pal-gbp/tiago_navigation-release.git";
        rev = "26f8d27d6242a4d3bc8eab5f9b56b8627ab6796d";
        hash = "sha256-Wh11jNAhnD0NE1tZF+yp7ltRwyRpmObXpUNPxI9eC7I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tiago_2dnav";
  version = "4.1.1-1";
  src = sources.tiago_2dnav;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_pal nav2_bringup pal_maps ros2launch rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
