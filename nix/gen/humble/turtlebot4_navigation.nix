{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_bringup,
  nav2_simple_commander,
  slam_toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_navigation = substituteSource {
      src = fetchgit {
        name = "turtlebot4_navigation-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "e40a22acdcc1bb0f0d3323a33b342b69d18f4ca7";
        hash = "sha256-TQtUW4KsbMqbChRrU1avtgz2g8QCRrrIRhm/n91V2vs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_navigation";
  version = "1.0.5-1";
  src = sources.turtlebot4_navigation;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_bringup nav2_simple_commander slam_toolbox ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
