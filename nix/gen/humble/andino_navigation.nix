{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  andino_gz_classic,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  nav2_bringup,
  navigation2,
  rviz2,
  substituteSource,
  turtlebot3_gazebo,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    andino_navigation = substituteSource {
      src = fetchgit {
        name = "andino_navigation-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "f469116cb40f3d9b7cad95383895d124c1c554a4";
        hash = "sha256-wOxOF+zxQVb/J0ld+07E+n1D7iR/YL3c/uxZJSYqGvs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "andino_navigation";
  version = "0.1.0-1";
  src = sources.andino_navigation;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ andino_gz_classic launch_ros nav2_bringup navigation2 rviz2 turtlebot3_gazebo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
