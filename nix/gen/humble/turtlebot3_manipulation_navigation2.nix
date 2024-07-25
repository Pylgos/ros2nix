{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  navigation2,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot3_manipulation_navigation2 = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_navigation2-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "cbaf2f56f7329ee67386c74cc612a25c103ef967";
        hash = "sha256-aYjcaOzRaX0vnheW4bXLkB2G2CoDqCIqER88EM2Vd24=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_manipulation_navigation2";
  version = "2.1.1-1";
  src = sources.turtlebot3_manipulation_navigation2;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ navigation2 rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
