{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  turtlebot4_base,
  turtlebot4_bringup,
  turtlebot4_diagnostics,
  turtlebot4_tests,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_robot = substituteSource {
      src = fetchgit {
        name = "turtlebot4_robot-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "f648ef08aade30931defacaa7f8d584ca26f44e1";
        hash = "sha256-Wa8sx+XUIJz+JEZKagMuFuFR4vnwKjeCF8cUEQmqPi0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_robot";
  version = "1.0.3-1";
  src = sources.turtlebot4_robot;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ turtlebot4_base turtlebot4_bringup turtlebot4_diagnostics turtlebot4_tests ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
