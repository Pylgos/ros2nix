{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  nav2_common,
  navigation2,
  slam_toolbox,
  substituteSource,
  turtlebot3_gazebo,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    nav2_bringup = substituteSource {
      src = fetchgit {
        name = "nav2_bringup-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "4935f763f6ed43cb2186db7bbc79e29aa8be7594";
        hash = "sha256-Bqt9FwkamqVrBfZaeaHYgXFiPZTxqnhqrkxa8LQVmJY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_bringup";
  version = "1.2.9-1";
  src = sources.nav2_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros nav2_common navigation2 slam_toolbox turtlebot3_gazebo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
