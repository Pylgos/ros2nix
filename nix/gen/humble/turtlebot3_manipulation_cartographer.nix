{
  ament_cmake,
  buildRosPackage,
  cartographer_ros,
  fetchgit,
  fetchurl,
  fetchzip,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot3_manipulation_cartographer = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_cartographer-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "c5832512bb6b1aa6f2a3529e05a175e1f9281d2b";
        hash = "sha256-Sy0PCezhNElM55kbcu3Ugb1nzl0Jp61OsW1e7dFew9w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_manipulation_cartographer";
  version = "2.1.1-1";
  src = sources.turtlebot3_manipulation_cartographer;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cartographer_ros rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
