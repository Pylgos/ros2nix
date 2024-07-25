{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_bringup,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot3_navigation2 = substituteSource {
      src = fetchgit {
        name = "turtlebot3_navigation2-source";
        url = "https://github.com/robotis-ros2-release/turtlebot3-release.git";
        rev = "bd61b9a0316b42d926ea11df17d3ec881ae658c1";
        hash = "sha256-BOZRX36RPGrZsyRH5fGt4Ri6cjmJBoi7TGP1Z7Dnz4Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_navigation2";
  version = "2.1.5-1";
  src = sources.turtlebot3_navigation2;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_bringup ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
