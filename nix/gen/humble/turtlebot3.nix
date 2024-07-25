{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  turtlebot3_bringup,
  turtlebot3_cartographer,
  turtlebot3_description,
  turtlebot3_example,
  turtlebot3_navigation2,
  turtlebot3_node,
  turtlebot3_teleop,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot3 = substituteSource {
      src = fetchgit {
        name = "turtlebot3-source";
        url = "https://github.com/robotis-ros2-release/turtlebot3-release.git";
        rev = "b670a0bed6d83c4cd5c5dc9339626d580c0806c4";
        hash = "sha256-5WW81vedE+7+MsKMisI1ZM6QoVOzzSkkA9NClEgd+qk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3";
  version = "2.1.5-1";
  src = sources.turtlebot3;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ turtlebot3_bringup turtlebot3_cartographer turtlebot3_description turtlebot3_example turtlebot3_navigation2 turtlebot3_node turtlebot3_teleop ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
