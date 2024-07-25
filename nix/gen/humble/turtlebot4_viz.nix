{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rqt_robot_monitor,
  rviz2,
  substituteSource,
  turtlebot4_description,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_viz = substituteSource {
      src = fetchgit {
        name = "turtlebot4_viz-source";
        url = "https://github.com/ros2-gbp/turtlebot4_desktop-release.git";
        rev = "d73ef3a62d0786a92c5d97eaa8d490a83eb74a81";
        hash = "sha256-nH7Y+3+zGDTHOsSApAV3eCu2LfzSzcbZIwsSDgT8Ppk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_viz";
  version = "1.0.0-1";
  src = sources.turtlebot4_viz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_robot_monitor rviz2 turtlebot4_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
