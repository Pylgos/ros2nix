{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  turtlebot3_manipulation_bringup,
  turtlebot3_manipulation_cartographer,
  turtlebot3_manipulation_description,
  turtlebot3_manipulation_hardware,
  turtlebot3_manipulation_moveit_config,
  turtlebot3_manipulation_navigation2,
  turtlebot3_manipulation_teleop,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot3_manipulation = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "89320575ac44feca58b385d8693cc8973d4fc0f1";
        hash = "sha256-0z2ymqwVFVE/UbhAqsdtYRNGRtZIPBcLjYApGyrvnG8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_manipulation";
  version = "2.1.1-1";
  src = sources.turtlebot3_manipulation;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ turtlebot3_manipulation_bringup turtlebot3_manipulation_cartographer turtlebot3_manipulation_description turtlebot3_manipulation_hardware turtlebot3_manipulation_moveit_config turtlebot3_manipulation_navigation2 turtlebot3_manipulation_teleop ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
